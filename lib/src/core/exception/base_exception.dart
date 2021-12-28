abstract class IllumineException {
  IllumineException({
    required this.source,
    required this.message,
  });

  final String source;
  final String message;
}
