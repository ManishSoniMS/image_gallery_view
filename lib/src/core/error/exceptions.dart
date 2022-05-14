
class GeneralException implements Exception {
  GeneralException({
    required this.code,
    required this.message,
  });

  final int code;
  final String message;

  @override
  String toString() {
    return 'GeneralException{code: $code, message: $message}';
  }
}
