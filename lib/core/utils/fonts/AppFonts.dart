import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../colors/AppColors.dart';

class AppFonts {
  static const String arabicFont = 'Arabic';

  static TextStyle textMedium = TextStyle(
    fontFamily: arabicFont,
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );
  static TextStyle textRegular = TextStyle(
    fontFamily: arabicFont,
    fontSize: 14,
    fontWeight: FontWeight.w300,
    color: Colors.black,
  );
  static TextStyle subTitleob = TextStyle(
    fontFamily: arabicFont,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: Colors.black,
  );
  static TextStyle titlelogin = TextStyle(
    fontFamily: arabicFont,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryColor,
  );
  static TextStyle otpTitle = TextStyle(
    fontFamily: arabicFont,
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryColor,
  );
  static TextStyle testfiels = TextStyle(
    fontFamily: arabicFont,
    fontSize: 16,
    fontWeight: FontWeight.w100,
    color: AppColors.primaryColor,
  );
  static TextStyle textLink = TextStyle(
    fontFamily: arabicFont,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.primaryColor,
  );
}
