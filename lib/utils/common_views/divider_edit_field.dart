import 'package:demo/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


/*
* divider below edit text
* */
class DividerEditField extends StatelessWidget {
  final type;

  const DividerEditField(this.type);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 375, height: 812)..init(context);

    return
      Container(
        margin: EdgeInsets.fromLTRB(
            ScreenUtil.getInstance().setHeight(40),
            ScreenUtil.getInstance().setHeight(6),
            ScreenUtil.getInstance().setHeight(40),
            ScreenUtil.getInstance().setHeight(0)),
        height: 1,
        width: MediaQuery.of(context).size.width,
        color: AppColors.colorWhite,
      );
  }
}

