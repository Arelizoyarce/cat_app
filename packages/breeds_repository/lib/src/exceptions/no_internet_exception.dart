class NoInternetException implements Exception {
  NoInternetException({
    required this.message,
    this.code = 0,
  });

  final String message;
  final int code;

  @override
  String toString() => 'NoInternetException: [$code] $message';
}