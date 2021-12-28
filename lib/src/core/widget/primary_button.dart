import 'package:flutter/material.dart';
import 'package:illumine/src/core/value/Constants.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(
      {Key? key,
      required this.backgroundColor,
      required this.rightArrowColor,
      this.onPressed,
      required this.label,
      this.width,
      this.height,
      this.enableStadiumBorder = false,
      this.fontSize = _defaultFontSize,
      this.fontWeight = _defaultFontWeight})
      : super(key: key);

  final void Function()? onPressed;
  final String label;
  final double fontSize;
  final FontWeight fontWeight;
  final double? width;
  final double? height;
  final bool enableStadiumBorder;
  final Color backgroundColor;
  final Color rightArrowColor;

  static const double _defaultFontSize = 18.0;
  static const FontWeight _defaultFontWeight = FontWeight.normal;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      padding: const EdgeInsets.symmetric(
        vertical: 18.0,
        horizontal: 18.0,
      ),
      color: backgroundColor,
      elevation: 0.0,
      shape: enableStadiumBorder
          ? const StadiumBorder()
          : RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      minWidth: width,
      height: height,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
        ),
        child: Row(
          children: [
            Text(
              label,
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
                fontFamily: Constants.kAppFonts.kFontFamily,
              ),
            ),
            Spacer(),
            Icon(
              Icons.arrow_forward_ios,
              color: rightArrowColor,
              size: 16,
            )
          ],
        ),
      ),
    );
  }
}
