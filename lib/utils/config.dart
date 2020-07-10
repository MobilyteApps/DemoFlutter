import 'package:fluttertoast/fluttertoast.dart';

import 'colors/app_colors.dart';

class Config {
  static void showToastCenter(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        backgroundColor: AppColors.colorWhite,
        textColor: AppColors.colorBlack,
        fontSize: 15.0);
  }
}