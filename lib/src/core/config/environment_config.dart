library condig_lib;

import 'dart:developer';

import '../value/strings.dart';

part 'application_config.dart';

//Todo(@ajinkyakaranjikar): Environments to be freezed before first stable release
//Todo(@ajinkyakaranjikar): This is temporary arrangement, values of all tracks (such as baseUrl) to be provided and confirmed from client

enum ReleaseEnvironment { development, staging, production }

extension _ReleaseEnvironmentExtension on ReleaseEnvironment {
  String get text {
    switch (this) {
      case ReleaseEnvironment.staging:
        return Strings.releaseEnvironmentStaging;

      case ReleaseEnvironment.production:
        return Strings.releaseEnvironmentProduction;

      case ReleaseEnvironment.development:
      default:
        return Strings.releaseEnvironmentDevelopment;
    }
  }
}

ReleaseEnvironment getReleaseEnvironmentEnumFromText(String environment) {
  switch (environment) {
    case Strings.releaseEnvironmentProduction:
      return ReleaseEnvironment.production;

    case Strings.releaseEnvironmentStaging:
      return ReleaseEnvironment.staging;

    case Strings.releaseEnvironmentDevelopment:
    default:
      return ReleaseEnvironment.development;
  }
}

class EnvironmentConfig {
  EnvironmentConfig({
    required Map<String, dynamic> releaseConfig,
    required Map<String, dynamic> applicationConfig,
  }) {
    final String environment =
        releaseConfig[Strings.releaseEnvironment] as String;

    _bearerToken = releaseConfig[Strings.releaseBearerToken] as String;
    _environment = getReleaseEnvironmentEnumFromText(environment);

    log('Running Illumine in `$environment` environment');

    // appConfig = _ApplicationConfig();

    final Map<String, dynamic> apiServer =
        applicationConfig[Strings.applicationConfigApiServer]
            as Map<String, dynamic>;

    final Map<String, dynamic> baseUrl =
        apiServer[Strings.applicationConfigBaseUrl] as Map<String, dynamic>;

    _useSecureHttp = apiServer[Strings.applicationConfigUseSecureHttp] as bool;

    _devBaseUrl = baseUrl[Strings.releaseEnvironmentDevelopment] as String;
    _stagBaseUrl = baseUrl[Strings.releaseEnvironmentStaging] as String;
    _prodBaseUrl = baseUrl[Strings.releaseEnvironmentProduction] as String;
  }

  // static late final _ApplicationConfig appConfig;

  static late final ReleaseEnvironment _environment;
  static ReleaseEnvironment get environment => _environment;

  static late final bool _useSecureHttp;
  static bool get useSecureHttp => _useSecureHttp;

  static late final String _bearerToken;
  static String get bearerToken => _bearerToken;

  static late final String _devBaseUrl;
  static late final String _stagBaseUrl;
  static late final String _prodBaseUrl;

  static String get baseUrl {
    switch (_environment) {
      case ReleaseEnvironment.development:
        return _devBaseUrl;

      case ReleaseEnvironment.staging:
        return _stagBaseUrl;

      case ReleaseEnvironment.production:
        return _prodBaseUrl;

      default:

        ///Here considering the default case to always route to the development server
        return _devBaseUrl;
    }
  }
}
