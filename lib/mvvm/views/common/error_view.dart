import 'package:flutter/material.dart';

///[ErrorView] is the widget that is shown when something is wrong
class ErrorView extends StatelessWidget {
  const ErrorView({
    Key? key,
    required this.title,
    required this.message,
  }) : super(key: key);

  final String title;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title,
            style: TextStyle(
              color: Colors.black,
            )),
      ),
      body: Center(
        child: Text(message,
            style: TextStyle(
              color: Colors.black,
            )),
      ),
    );
  }
}
