import 'package:flutter/material.dart';
import 'package:illumine/src/core/value/Constants.dart';
import 'package:illumine/src/core/value/colors.dart';

String? validateEmail(String? value) {
  String? _msg;
  RegExp regex = new RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  if (value != null) {
    if (value.isEmpty) {
      _msg = "Your username is required";
    } else if (!regex.hasMatch(value)) {
      _msg = "Please provide a valid emal address";
    }
  }
  return _msg;
}

String? validatePassword(String? value) {
  String? _msg;
  if (value != null) {
    if (value.isEmpty) {
      _msg = "Please enter password";
    }
  }
  return _msg;
}

String? validateNames(String? value) {
  String? _msg;
  if (value != null) {
    if (value.isEmpty) {
      _msg = "Please enter valid input";
    }
  }
  return _msg;
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
//Color color1 = HexColor("b74093");

AppBar customAppBarWithTitle(String title) {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.white,
    foregroundColor: Colors.black,
    title: Text(
      title,
      style: TextStyle(
        fontSize: 20,
        color: IllumineColors.appBlackColor,
        fontWeight: Constants.kAppFonts.kFontWeightBold,
        fontFamily: Constants.kAppFonts.kFontFamily,
      ),
    ),
    centerTitle: false,
  );
}
