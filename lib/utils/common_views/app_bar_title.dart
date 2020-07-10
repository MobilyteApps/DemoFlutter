import 'package:demo/utils/colors/app_colors.dart';
import 'package:demo/utils/language/demo_localization.dart';
import 'package:demo/utils/styles/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


/*
* top app bar title header text*/
class AppBarTitle extends StatelessWidget {
  final screenType;

  const AppBarTitle(this.screenType);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 375, height: 812)..init(context);

    return
      Container(
        color: AppColors.colorGrayBar,
        child: Text(
          DemoLocalizations.of(context).trans('appName'),
          style: Style.appBarStyle,
        ),
      );
  }
}

