class ErrorEvent {
  const ErrorEvent({
    required this.feature,
    required this.error,
    required this.stackTrace,
    required this.fatal,
  });

  final String feature;
  final Object error;
  final StackTrace stackTrace;
  final bool fatal;
}
