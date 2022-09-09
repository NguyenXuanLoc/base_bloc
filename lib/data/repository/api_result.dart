class ApiResult<T> {
  dynamic? error;
  int? statusCode;
  String? message;
  T? data;

  ApiResult({
    this.error,
    this.data,
    this.statusCode,
    this.message,
  });
}
