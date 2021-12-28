import 'base_exception.dart';

class MissingParameterException extends IllumineException {
  MissingParameterException({
    required String source,
    required String message,
    required this.parameter,
  }) : super(
          source: source,
          message: message,
        );

  final String parameter;
}
