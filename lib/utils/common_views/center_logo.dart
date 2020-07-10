import 'package:demo/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


/*
* centre icon
* current image not added*/
class CentreLogo extends StatelessWidget {
  final type;

  const CentreLogo(this.type);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 375, height: 812)..init(context);

    return
      Container(
        height: ScreenUtil.getInstance().setHeight(100),
        width:  ScreenUtil.getInstance().setHeight(100),
        margin: EdgeInsets.fromLTRB(ScreenUtil.getInstance().setWidth(0),
            ScreenUtil.getInstance().setWidth(30), 0, 0),
        child:
        Stack(
          children: <Widget>[
            Center(
              child:
              Container(
                height: ScreenUtil.getInstance().setHeight(100),
                width:  ScreenUtil.getInstance().setHeight(100),
                color: Colors.transparent,
                child: new Container(
                  decoration: new BoxDecoration(
                      color: AppColors.colorWhite,
                      borderRadius: new BorderRadius.only(
                        topLeft:  Radius.circular(ScreenUtil.getInstance().setHeight(20)),
                        topRight:  Radius.circular(ScreenUtil.getInstance().setHeight(20)),
                        bottomRight:  Radius.circular(ScreenUtil.getInstance().setHeight(20)),
                        bottomLeft:  Radius.circular(ScreenUtil.getInstance().setHeight(20)),
                      )
                  ),

                ),
              ),
            ),

            Center(
              child:
              Container(
                height: ScreenUtil.getInstance().setHeight(90),
                width:  ScreenUtil.getInstance().setHeight(90),
                color: Colors.transparent,
                child: new Container(
                  decoration: new BoxDecoration(
                      color: AppColors.colorBlueDark,
                      borderRadius: new BorderRadius.only(
                        topLeft:  Radius.circular(ScreenUtil.getInstance().setHeight(20)),
                        topRight:  Radius.circular(ScreenUtil.getInstance().setHeight(20)),
                        bottomRight:  Radius.circular(ScreenUtil.getInstance().setHeight(20)),
                        bottomLeft:  Radius.circular(ScreenUtil.getInstance().setHeight(20)),
                      )
                  ),

                ),
              ),
            )
          ],
        ),
      );
  }
}

