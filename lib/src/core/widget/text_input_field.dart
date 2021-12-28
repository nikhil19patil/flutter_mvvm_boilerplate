import 'package:flutter/material.dart';
import 'package:illumine/src/core/value/Constants.dart';

class PrimaryTextInputField extends StatelessWidget {
  const PrimaryTextInputField(
      {Key? key,
      this.hint,
      this.textColor = _defaultTextColor,
      this.hintColor = _defaultHintColor,
      this.fillColor = _defaultFillColor,
      this.fontSize = _defaultTextSize,
      this.fontWeight = _defaultFontWeight,
      this.borderRadius = _defaultBorderRadius,
      this.controller,
      this.validator,
      this.autovalidateMode,
      this.obscureText = false,
      required this.keyboardType})
      : super(key: key);

  final String? hint;
  final Color textColor;
  final Color hintColor;
  final Color fillColor;
  final double fontSize;
  final FontWeight fontWeight;
  final double borderRadius;
  final TextEditingController? controller;
  final AutovalidateMode? autovalidateMode;
  final String? Function(String?)? validator;
  final bool obscureText;
  final TextInputType keyboardType;

  static const double _defaultTextSize = 16.0;
  static const FontWeight _defaultFontWeight = FontWeight.normal;
  static const double _defaultBorderRadius = 24.0;
  static const Color _defaultTextColor = Colors.black;
  static const Color _defaultHintColor = Color(0xFFA8A8A8);
  static const Color _defaultFillColor = Color(0xFFF6F6F6);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: TextAlign.start,
      style: TextStyle(
          color: textColor,
          fontSize: fontSize,
          fontFamily: Constants.kAppFonts.kFontFamily),
      scrollPadding: const EdgeInsets.only(bottom: 32.0),
      controller: controller,
      autovalidateMode: autovalidateMode,
      validator: validator,
      obscureText: obscureText,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 26, vertical: 26),
        hintText: hint,
        hintStyle: TextStyle(color: hintColor, fontSize: fontSize),
        filled: true,
        fillColor: fillColor,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }
}
