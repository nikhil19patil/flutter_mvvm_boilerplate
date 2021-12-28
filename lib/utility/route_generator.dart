import 'package:flutter/material.dart';
import 'package:illumine/mvvm/views/common/splash_screen.dart';
import 'package:illumine/mvvm/views/users_module/github_users_screen.dart';

class RouteConstants {
  static const kSplashScreen = "/splashScreen";
  static const String kUsersScreen = '/loginScreen';
}

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteConstants.kSplashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case RouteConstants.kUsersScreen:
        return MaterialPageRoute(builder: (_) => const GithubUsersScreen());

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
