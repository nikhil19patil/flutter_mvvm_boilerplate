import 'package:flutter/material.dart';
import 'package:illumine/src/core/value/Constants.dart';

class UnderlinedTextButton extends StatelessWidget {
  const UnderlinedTextButton(
      {Key? key,
      this.onPressed,
      required this.label,
      this.color = const Color(0xFF8D8D8D),
      this.fontSize = _defaultFontSize,
      this.fontWeight = _defaultFontWeight})
      : super(key: key);

  final void Function()? onPressed;
  final String label;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;

  static const double _defaultFontSize = 14.0;
  static const FontWeight _defaultFontWeight = FontWeight.normal;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        label,
        style: TextStyle(
            color: color,
            fontFamily: Constants.kAppFonts.kFontFamily,
            fontSize: fontSize,
            fontWeight: FontWeight.w400,
            decoration: TextDecoration.underline),
      ),
    );
  }
}
