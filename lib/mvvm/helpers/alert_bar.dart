import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class AlertBar {
  static final int LENGTH_SHORT = 1; //1 seconds
  static final int LENGTH_LONG = 2; // 2 seconds
  static final int LENGTH_VERY_LONG = 3; // 3 seconds

  static final int TOP = 1;
  static final int BOTTOM = 2;

  static void show(
    BuildContext context, {
    required String title,
    required String description,
    int? position = 2,
    int? duration = 3,
    Color backgroundColor = Colors.black,
  }) {
    Flushbar(
      title: title,
      message: description,
      duration: Duration(seconds: duration!),
      flushbarPosition:
          (position == TOP) ? FlushbarPosition.TOP : FlushbarPosition.BOTTOM,
      backgroundColor: backgroundColor,
    ).show(context);
  }
}
