import 'package:demo/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


/*
* top about question mark button*/
class AboutDemo extends StatelessWidget {
  final screenType;

  const AboutDemo(this.screenType);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 375, height: 812)..init(context);

    return
      Container(
        margin: EdgeInsets.fromLTRB(ScreenUtil.getInstance().setWidth(20),
            ScreenUtil.getInstance().setWidth(10), 0, 0),
        child:
        Stack(
          children: <Widget>[
            Container(
                height: ScreenUtil.getInstance().setHeight(50),
                width: ScreenUtil.getInstance().setHeight(50),
                child:
                Align(
                  alignment: Alignment.center,
                  child:
                  Icon(Icons.arrow_downward,
                    size: ScreenUtil.getInstance().setHeight(20) ,
                    color: AppColors.colorWhite,),
                )
            ),

            Center(
              child: Container(
                height: ScreenUtil.getInstance().setHeight(50),
                width: ScreenUtil.getInstance().setHeight(50),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all( Radius.circular(40)),
                    border: Border.all(width: 1,color: Colors.white,style: BorderStyle.solid)
                ),
              ),
            )
          ],
        ),
      );
  }
}

