class AppConstants {
  static const String APP_NAME = 'Flutter Boilerplate';

  //Allows Developers to test on custom base URL by showing an custom URL screen at start up.
  //Application have Safe checks in main.dart so custom URL page will never show if isProdBuild flag in AppConstants is set as true.
  static const bool isCustomURLBuild = true;

  //Flutter level flag
  //Will set base URL to Production if set true.
  static const bool isProdBuild = false;

  static const Map<String, String> Countries = {
    "India": "in"
  };
}
