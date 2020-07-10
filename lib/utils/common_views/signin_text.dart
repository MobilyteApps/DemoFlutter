import 'package:demo/utils/language/demo_localization.dart';
import 'package:demo/utils/styles/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


/*
* sign in text in middle
* */
class SignIn extends StatelessWidget {
  final type;

  const SignIn(this.type);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 375, height: 812)..init(context);

    return
      Container(
        height: ScreenUtil.getInstance().setHeight(100),
        width:  type == "login" ? ScreenUtil.getInstance().setHeight(100) : ScreenUtil.getInstance().setHeight(200),
        margin: EdgeInsets.fromLTRB(ScreenUtil.getInstance().setWidth(0),
            ScreenUtil.getInstance().setWidth(10), 0, 0),
        child:
        Center(
          child:
          Text(type == "login" ? DemoLocalizations.of(context).trans('signIn') :
          DemoLocalizations.of(context).trans('reg'),
          style: Style.signInStyle,)
        ),
      );
  }
}

