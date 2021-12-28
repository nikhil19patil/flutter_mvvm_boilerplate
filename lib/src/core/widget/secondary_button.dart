import 'package:flutter/material.dart';
import 'package:illumine/src/core/value/Constants.dart';
import 'package:illumine/src/core/value/colors.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton(
      {Key? key,
      required this.label,
      this.leading,
      this.onPressed,
      this.color = Colors.white,
      this.textColor = IllumineColors.textColorPrimary,
      this.fontSize = _defaultFontSize,
      this.fontWeight = _defaultFontWeight})
      : super(key: key);

  static const double _globalBorderRadius = 20.0;
  static const Color _globalShadowColor = Colors.black12;
  static const double _globalShadowBlurRadius = 2.0;
  static const Offset _globalShadowOffset = Offset(0, 2);
  static const double _defaultFontSize = 18.0;
  static const FontWeight _defaultFontWeight = FontWeight.normal;

  final void Function()? onPressed;
  final Widget? leading;
  final String label;
  final Color color;
  final Color textColor;
  final double fontSize;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(_globalBorderRadius),
        boxShadow: const [
          BoxShadow(
            color: _globalShadowColor,
            blurRadius: _globalShadowBlurRadius,
            //offset: _globalShadowOffset,
          ),
        ],
      ),
      child: MaterialButton(
        onPressed: onPressed,
        elevation: 0.0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(_globalBorderRadius)),
        color: color,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              if (leading != null)
                Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: leading,
                ),
              Text(
                label,
                style: TextStyle(
                    fontFamily: Constants.kAppFonts.kFontFamily,
                    fontSize: fontSize,
                    color: textColor,
                    fontWeight: FontWeight.w400),
              )
            ],
          ),
        ),
      ),
    );
  }
}
