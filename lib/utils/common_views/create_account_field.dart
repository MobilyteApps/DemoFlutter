import 'package:demo/utils/colors/app_colors.dart';
import 'package:demo/utils/language/demo_localization.dart';
import 'package:demo/utils/navigator/routes.dart';
import 'package:demo/utils/styles/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


/*
* bottom create account text field
* */
class CreateAccountText extends StatelessWidget {
  final screenType;

  const CreateAccountText(this.screenType);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 375, height: 812)..init(context);

    return
      Container(
        alignment: Alignment.bottomCenter,
        margin: EdgeInsets.fromLTRB(0, ScreenUtil.getInstance().setHeight(20), 0,
          ScreenUtil.getInstance().setWidth(20),
        ),
        width: MediaQuery.of(context).size.width,
        child: InkWell(
          onTap: (){
            if(screenType == "login") {
              //navigate to register screen on click
              Keys.navKey.currentState.pushNamed(Routes.registerScreen);
            }else{
              //go back at sign in page
              Navigator.pop(context);
            }
          },
          child:
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                screenType == "login" ? DemoLocalizations.of(context).trans('signup') :
                DemoLocalizations.of(context).trans('signin'),
                style: Style.createStyle,
                textAlign: TextAlign.end,
              ),
              Container(
                margin: EdgeInsets.fromLTRB( ScreenUtil.getInstance().setHeight(10),0, 0,
                  ScreenUtil.getInstance().setWidth(0),
                ),
                child: Icon(Icons.people, color: AppColors.colorWhite,
                  size: ScreenUtil.getInstance().setHeight(20),),
              ),
            ],
          )
        )
      );
  }
}
