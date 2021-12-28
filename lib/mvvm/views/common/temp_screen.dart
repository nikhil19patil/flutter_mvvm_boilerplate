import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:illumine/src/core/value/Constants.dart';
import 'package:illumine/src/core/value/assets.dart';
import 'package:illumine/src/core/value/colors.dart';

class TempScreen extends StatefulWidget {
  const TempScreen({Key? key}) : super(key: key);

  @override
  _TempScreenState createState() => _TempScreenState();
}

class _TempScreenState extends State<TempScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: Text("Illumine"),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: SvgPicture.asset(
                  Assets.loginScreenHeaderGraphics,
                  height: 200,
                  width: 200,
                ),
              ),
              Text(
                "Work in progress ... ",
                style: TextStyle(
                  fontSize: 20,
                  color: IllumineColors.appBlackColor,
                  fontWeight: FontWeight.bold,
                  fontFamily: Constants.kAppFonts.kFontFamily,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
