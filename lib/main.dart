import 'package:flutter/material.dart';
import 'package:illumine/app.dart';
import 'package:illumine/src/core/config/environment_config.dart';
import 'package:illumine/src/core/util/json_utils.dart';
import 'package:illumine/src/core/value/assets.dart';
import 'package:illumine/src/core/value/strings.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  ///Loading and setting up the environment configuration
  final releaseConfig = (await JsonUtils.parseJsonFromAssets(
      Assets.configRelease))[Strings.releaseConfig] as Map<String, dynamic>;

  final applicationConfig = (await JsonUtils.parseJsonFromAssets(
          Assets.configApplication))[Strings.applicationConfig]
      as Map<String, dynamic>;

  EnvironmentConfig(
      releaseConfig: releaseConfig, applicationConfig: applicationConfig);

  runApp(MyApp());
}
