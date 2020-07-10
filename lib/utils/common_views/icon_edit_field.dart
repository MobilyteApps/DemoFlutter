import 'package:demo/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


/*
* icon at right of edit field
* */
class IconEditField extends StatelessWidget {
  final type;

  const IconEditField(this.type);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 375, height: 812)..init(context);

    return
      Container(
        margin: EdgeInsets.fromLTRB(ScreenUtil.getInstance().setHeight(0),
            ScreenUtil.getInstance().setHeight(0), ScreenUtil.getInstance().setHeight(40), 0),
        child: PhysicalModel(
          color: Colors.transparent,
          child: Container(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              width: MediaQuery.of(context).size.width * 0.10,
              height: MediaQuery.of(context).size.width * 0.10,
              child: Center(
                child: Icon(type == "username" ? Icons.camera_alt :
                  type == "email" ? Icons.email : Icons.vpn_key,
                  color: AppColors.colorWhite,
                  size: ScreenUtil.getInstance().setHeight(20),),
              )),
        ),
      );
  }
}

