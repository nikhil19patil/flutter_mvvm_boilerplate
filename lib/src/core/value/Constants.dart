import 'package:flutter/material.dart';

class Constants {
  Constants._();

  static AppFonts kAppFonts = const AppFonts();
  static Common kCommon = const Common();
  static Login kLogin = const Login();
  static SharedPrefConstant kSharedPrefConstant = const SharedPrefConstant();
}

class Common {
  const Common();
  EdgeInsets get kVerticalInsetsMedium => EdgeInsets.symmetric(vertical: 16.0);
  EdgeInsets get kVerticalInsetsSmall => EdgeInsets.symmetric(vertical: 8.0);
}

class AppFonts {
  const AppFonts();

  double get kFontSizeExtraLarge => 40.0;
  double get kFontSizeLarge => 22.0;
  double get kFontSizeMedium => 18.0;
  double get kFontSizeSmall => 16.0;
  double get kFontSizeExtraSmall => 14.0;

  FontWeight get kFontWeightLight => FontWeight.w300;
  FontWeight get kFontWeightRegular => FontWeight.w400;
  FontWeight get kFontWeightMedium => FontWeight.w500;
  FontWeight get kFontWeightBold => FontWeight.w700;

  String get kFontFamily => 'TisaSansPro';
}

class Login {
  const Login();

  double get kHeaderGraphicsWidth => 164.0; //0.398
  double get kHeaderGraphicsHeight => 60.0; //.094
  double get kLoginFormMaxWidth => 300.0;
  double get kLoginButtonHeight => 64.0;
}

class SharedPrefConstant {
  const SharedPrefConstant();

  String get kUserModel => "kUserModel";
  String get kAuthToken => "kAuthToken";
}
