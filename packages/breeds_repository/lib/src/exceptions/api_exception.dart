class ApiException implements Exception {
  ApiException({
    required this.code,
    required this.message,
  });

  final int code;
  final String message;

  @override
  String toString() => 'ApiException: [$code] $message';
}