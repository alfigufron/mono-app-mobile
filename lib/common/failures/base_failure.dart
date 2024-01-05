abstract class BaseFailure<T> implements Exception {
  final T? value;
  final String? code;
  final String? message;
  final StackTrace? stackTrace;
  BaseFailure({
    this.value,
    this.code,
    this.message,
    this.stackTrace,
  });
}
