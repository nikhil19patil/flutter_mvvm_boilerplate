import 'base_exception.dart';

class UnsupportedException extends IllumineException {
  UnsupportedException({
    required String source,
    required String message,
  }) : super(
          source: source,
          message: message,
        );
}
