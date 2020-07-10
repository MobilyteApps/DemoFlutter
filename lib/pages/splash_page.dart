import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:demo/utils/navigator/routes.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}



class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    super.initState();
    SystemChannels.textInput.invokeMethod('TextInput.hide'); //hide keyboard
    //start splash timer
    startTime();
  }


  @override
  void dispose() {
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 375, height: 664)..init(context);
    return
      Scaffold(
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Color(0xFF347AAE), Color(0xFF4C95CC)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter),
                  ),
                ),
              ],
            )),
      );
  }


  startTime() async {
    var _duration = Duration(seconds: 3); //splash timer = 3
    return Timer(_duration, navigationPage);
  }


  //navigate to screen .....
  void navigationPage() async {
    Keys.navKey.currentState.pushReplacementNamed(Routes.signInScreen);
  }

}
