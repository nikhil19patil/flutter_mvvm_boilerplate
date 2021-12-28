import 'package:flutter/material.dart';
import 'package:illumine/mvvm/views/users_module/github_users_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return _buildFutureBuilder(waitASecond);
  }

  Scaffold _splashScaffold() {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: Icon(
                Icons.cable_rounded,
                size: 40,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const SafeArea(
        child: Text(
          "Loading...",
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  FutureBuilder<bool> _buildFutureBuilder(Future<bool> Function() waitASecond) {
    return FutureBuilder(
        future: waitASecond(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return _splashScaffold();
            default:
              if (snapshot.hasError) {
                debugPrint("snapshot.hasError");
                return const GithubUsersScreen();
              } else if (snapshot.data!) {
                debugPrint("snapshot.data?.id == null");
                return const GithubUsersScreen();
              } else {
                debugPrint("has data");
                return const GithubUsersScreen();
              }
          }
        });
  }

  Future<bool> waitASecond() async {
    await Future.delayed(const Duration(seconds: 3));
    return true;
  }
}
