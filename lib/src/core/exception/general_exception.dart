import 'base_exception.dart';

class GeneralException extends IllumineException {
  GeneralException({
    required String source,
    required String message,
  }) : super(
          source: source,
          message: message,
        );
}
