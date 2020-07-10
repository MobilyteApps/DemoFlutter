import 'package:demo/utils/colors/app_colors.dart';
import 'package:demo/utils/language/demo_localization.dart';
import 'package:demo/utils/styles/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'dialog/language_selector.dart';

class LanguageDrop extends StatefulWidget {
  @override
  _LanguageDropState createState() => _LanguageDropState();
}

/*
* top app bar language drop view*/
class _LanguageDropState extends State<LanguageDrop> implements LanguageDialogListener{

  String language = "en";

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 375, height: 812)..init(context);

    return
      Container(
          margin: EdgeInsets.fromLTRB(0,
              ScreenUtil.getInstance().setWidth(10), ScreenUtil.getInstance().setWidth(20), 0),
        child:
       InkWell(
         onTap: (){
           AppDialogs().showAlertDialog(
               context, DemoLocalizations.of(context).trans('language_header'), "",
               DemoLocalizations.of(context).trans('okay'), "", this);
         },
         child:
         Row(
           children: <Widget>[
             Text(
               language,
               style: Style.languageStyle,
             ),

             Container(
               child:
               Icon(Icons.arrow_drop_down,
                 size: ScreenUtil.getInstance().setHeight(25) ,
                 color: AppColors.colorWhite,),
             )
           ],
         ),
       )
      );
  }

  @override
  void onNegativeClick() {
    // TODO: implement onNegativeClick
  }

  @override
  void onPositiveClick(BuildContext context, String lang) {
    // TODO: implement onPositiveClick
    print(lang);
   setState(() {
     if(lang == "en"){
       language = "en";
     }else{
       language = "fr";
     }
   });
  }
}

