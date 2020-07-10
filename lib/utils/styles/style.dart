import 'dart:ui';

import 'package:demo/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Style {
  //app bar text
  static var appBarStyle = GoogleFonts.roboto(
    fontSize: 21,
    fontWeight: FontWeight.w700,
    color: AppColors.colorBlueDark,
    fontStyle: FontStyle.normal,
  );

  //language selection text style
  static var languageStyle = GoogleFonts.roboto(
    fontSize: 17,
    fontWeight: FontWeight.w300,
    color: AppColors.colorWhite,
    fontStyle: FontStyle.normal,
  );

  //middle sign in text style
  static var signInStyle = GoogleFonts.robotoSlab(
    fontSize: 24,
    fontWeight: FontWeight.w500,
    color: AppColors.colorWhite,
    fontStyle: FontStyle.normal,
  );

  //user name hint style
  static var hintStyle = GoogleFonts.roboto(
    fontSize: 17,
    fontWeight: FontWeight.w300,
    color: Colors.white54,
    fontStyle: FontStyle.normal,
  );

  //user name style
  static var userStyle = GoogleFonts.roboto(
    fontSize: 17,
    fontWeight: FontWeight.w500,
    color: Colors.white,
    fontStyle: FontStyle.normal,
  );

  //next button text style
  static var nextButtonStyle = GoogleFonts.roboto(
    fontSize: 17,
    fontWeight: FontWeight.w500,
    color: AppColors.colorBlueDark,
    fontStyle: FontStyle.normal,
  );

  //create account text
  static var createStyle = GoogleFonts.roboto(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.colorWhite,
    fontStyle: FontStyle.normal,
  );
}