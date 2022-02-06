class ApiException implements Exception {
  final String message;

  const ApiException({
    required this.message,
  });

  @override
  String toString() {
    return message;
  }
}
