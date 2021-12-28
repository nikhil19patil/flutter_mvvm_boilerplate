import 'dart:io';

import 'package:dio/dio.dart';

import '../config/environment_config.dart';
import '../exception/unsupported_exception.dart';
import 'network_response.dart';

enum NetworkCallType { get, post, put }

class NetworkHelper {
  NetworkHelper._internal() {
    _dio = Dio();
  }

  static final NetworkHelper _instance = NetworkHelper._internal();

  static NetworkHelper get instance => _instance;

  factory NetworkHelper() => _instance;

  static late final Dio _dio;

  static const String _secureHttp = 'https://';
  static const String _nonSecureHttp = 'http://';

  static const Map<String, String> _defaultHeaders = {
    HttpHeaders.contentTypeHeader: 'application/json',
  };

  ///This method [_validateStatus] always returns true so that dio returns data for any http status code
  static bool _validateStatus(_) => true;
  static const bool _receiveDataWhenStatusError = true;

  Future<NetworkResponse> call(
      {required final String url,
      required final NetworkCallType type,
      final Map<String, dynamic> requestBody = const {},
      final bool useSecureHttp = true,
      final bool addBearerToken = true,
      final String? bearerToken}) async {
    final String httpUrl = (useSecureHttp ? _secureHttp : _nonSecureHttp) + url;

    final Map<String, String> headers = Map.from(_defaultHeaders);
    if (addBearerToken) {
      headers.addEntries([
        MapEntry(HttpHeaders.authorizationHeader,
            'bearer ${bearerToken ?? EnvironmentConfig.bearerToken}')
      ]);
    }

    late final Response httpResponse;

    switch (type) {
      case NetworkCallType.get:
        httpResponse = await _dio.get(
          httpUrl,
          queryParameters: requestBody,
          options: Options(
            headers: headers,
            receiveDataWhenStatusError: _receiveDataWhenStatusError,
            validateStatus: _validateStatus,
          ),
        );
        break;

      case NetworkCallType.post:
        httpResponse = await _dio.post(
          httpUrl,
          data: requestBody,
          options: Options(
            headers: headers,
            receiveDataWhenStatusError: _receiveDataWhenStatusError,
            validateStatus: _validateStatus,
          ),
        );
        break;

      case NetworkCallType.put:
        httpResponse = await _dio.put(
          httpUrl,
          data: requestBody,
          options: Options(
            headers: headers,
            receiveDataWhenStatusError: _receiveDataWhenStatusError,
            validateStatus: _validateStatus,
          ),
        );
        break;

      default:
        throw UnsupportedException(
          source: 'HttpHelper call',
          message: 'This network call type `$type` is not supported',
        );
    }

    final NetworkResponse response = NetworkResponse(
      statusCode: httpResponse.statusCode ?? -1,
      statusMessage: httpResponse.statusMessage,
      data: httpResponse.data,
    );
    return response;
  }
}
