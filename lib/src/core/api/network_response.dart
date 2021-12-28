import '../exception/general_exception.dart';
import '../exception/missing_parameter_exception.dart';
import 'api_exchange_keys.dart';
import 'base_network_response.dart';

class NetworkResponse extends BaseNetworkResponse {
  NetworkResponse({
    final String? statusMessage,
    required final int statusCode,
    final dynamic data,
  }) : super(
          statusMessage: statusMessage,
          statusCode: statusCode,
          data: data,
        );

  // factory NetworkResponse.fromJson(Map<String, dynamic> data) {
  //   ///These assert statements work only in debug mode, and has no effect in release mode
  //   assert(data.isNotEmpty,
  //       'Received empty data object in NetworkResponse.fromJson');
  //   assert(data.containsKey(ApiExchangeKeys.statusMessage),
  //       'Data object does not contain required key `${ApiExchangeKeys.statusMessage}`');
  //   assert(data.containsKey(ApiExchangeKeys.statusCode),
  //       'Data object does not contains required key `${ApiExchangeKeys.statusCode}`');
  //   assert(data.containsKey(ApiExchangeKeys.data),
  //       'Data object does not contains required key `${ApiExchangeKeys.data}`');

  //   //Todo(@ajinkyakaranjikar): Below assert statement should be kept/removed based on confirmation from client
  //   /// IMPORTANT: Below conditions will impact performance, but neccessary for a initial stage
  //   /// to understand the App and Network communication errors better
  //   /// These should be removed once the app progresses to a certain timeline
  //   /// and a crash analytics is in place

  //   if (data.isEmpty) {
  //     throw GeneralException(
  //       source: 'NetworkResponse.fromJson',
  //       message: 'Received empty data object in NetworkResponse.fromJson',
  //     );
  //   }
  //   if (!data.containsKey(ApiExchangeKeys.statusMessage)) {
  //     throw MissingParameterException(
  //       source: 'NetworkResponse.fromJson',
  //       parameter: ApiExchangeKeys.statusMessage,
  //       message:
  //           'Data object does not contain required key `${ApiExchangeKeys.statusMessage}`',
  //     );
  //   }
  //   if (!data.containsKey(ApiExchangeKeys.statusCode)) {
  //     throw MissingParameterException(
  //       source: 'NetworkResponse.fromJson',
  //       parameter: ApiExchangeKeys.statusCode,
  //       message:
  //           'Data object does not contain required key `${ApiExchangeKeys.statusCode}`',
  //     );
  //   }
  //   if (!data.containsKey(ApiExchangeKeys.data)) {
  //     throw MissingParameterException(
  //       source: 'NetworkResponse.fromJson',
  //       parameter: ApiExchangeKeys.data,
  //       message:
  //           'Data object does not contain required key `${ApiExchangeKeys.data}`',
  //     );
  //   }

  //   return NetworkResponse(
  //     statusMessage: data[ApiExchangeKeys.statusMessage] as String,
  //     statusCode: data[ApiExchangeKeys.statusCode] as int,
  //     data: data[ApiExchangeKeys.data] as Map<String, dynamic>,
  //     result: (data[ApiExchangeKeys.data]
  //         as Map<String, dynamic>)[ApiExchangeKeys.result],
  //   );
  // }
}
