abstract class BaseNetworkResponse {
  BaseNetworkResponse({
    this.statusMessage,
    required this.statusCode,
    this.data,
  });

  final String? statusMessage;
  final int statusCode;
  final dynamic data;
}
