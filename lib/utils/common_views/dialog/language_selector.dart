import 'package:demo/utils/colors/app_colors.dart';
import 'package:demo/utils/config.dart';
import 'package:demo/utils/language/demo_localization.dart';
import 'package:demo/utils/language/language_application.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class LanguageDialogListener {
  void onPositiveClick(BuildContext context, String language);

  void onNegativeClick();
}


typedef OkDialogListener = void Function();


class AppDialogs {
  static final AppDialogs _singleton = AppDialogs._internal();
  int _radioValue1 = -1;

  factory AppDialogs() {
    return _singleton;
  }

  AppDialogs._internal();


  void showAlertDialog(
      BuildContext context,
      String title,
      String content,
      String positiveBtnName,
      String negativeBtnName,
      LanguageDialogListener listener) {
    // flutter defined function
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              backgroundColor: AppColors.colorWhite,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              title: Text(title,
                  style: GoogleFonts.openSans(
                    fontSize: ScreenUtil.getInstance().setWidth(18),
                    color: AppColors.colorBlueDark,
                    fontWeight: FontWeight.w700,
                  )),
              content: SingleChildScrollView(
                child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: AppColors.colorWhite,
                        borderRadius:
                        BorderRadius.all(new Radius.circular(20))),
                    height: ScreenUtil.getInstance().setHeight(130),
                    // Change as per your requirement
                    width: MediaQuery.of(context).size.width,
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Theme(
                                data: ThemeData(
                                    unselectedWidgetColor:
                                    AppColors.colorBlack),
                                child: new Radio(
                                  value: 0,
                                  groupValue: _radioValue1,
                                  activeColor: AppColors.colorBlack,
                                  onChanged: (int value) {
                                    setState(() {
                                      _radioValue1 = value;
                                    });
                                    // Whenever you need, call setState on your variable
//                                      setState(() => selectedRadio = value);
                                  },
                                ),
                              ),
                              new Text(
                               "English",
                                style: GoogleFonts.openSans(
                                  fontSize:
                                  ScreenUtil.getInstance().setWidth(15),
                                  color: AppColors.colorBlack,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Theme(
                                data: ThemeData(
                                    unselectedWidgetColor:
                                    AppColors.colorBlack),
                                child: new Radio(
                                  value: 1,
                                  groupValue: _radioValue1,
                                  activeColor: AppColors.colorBlack,
                                  onChanged: (int value) {
                                    setState(() {
                                      _radioValue1 = value;
                                    });
                                    // Whenever you need, call setState on your variable
//                                      setState(() => selectedRadio = value);
                                  },
                                ),
                              ),
                              new Text(
                                "French",
                                style: GoogleFonts.openSans(
                                  fontSize:
                                  ScreenUtil.getInstance().setWidth(15),
                                  color: AppColors.colorBlack,
                                  fontWeight: FontWeight.w400,
                                ),
                              )
                            ],
                          ),

                        ],
                      ),
                    )),
              ),
              actions: <Widget>[
                FlatButton(
                  child: Text(
                      positiveBtnName
                          .toUpperCase(),
                      style: GoogleFonts.openSans(
                        fontSize: ScreenUtil.getInstance().setWidth(15),
                        color: AppColors.colorBlack,
                        fontWeight: FontWeight.w400,
                      )),
                  onPressed: () async{
                    if(_radioValue1 == -1){
                      Config.showToastCenter("Select language");
                    }else if(_radioValue1 == 0){
                      await languageApplication.onLocaleChanged(Locale('en'));
                      listener.onPositiveClick(context,"en");
                      Navigator.of(context).pop();
                    }else if(_radioValue1 == 1){
                      await languageApplication.onLocaleChanged(Locale('fr_FR'));
                      listener.onPositiveClick(context, "fr");
                      Navigator.of(context).pop();
                    }
                  },
                ),
              ],
            );
          });
        });
  }
}

