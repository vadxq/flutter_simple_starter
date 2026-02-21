class AppError implements Exception {
  const AppError({
    required this.code,
    required this.message,
    this.cause,
  });

  final String code;
  final String message;
  final Object? cause;

  @override
  String toString() => 'AppError(code: $code, message: $message, cause: $cause)';
}
