class AResponse<T>{
  AResponse({
    this.data,
    this.statusCode,
  });

  /// Http status code.
  int? statusCode;

  /// Response body. may have been transformed, please refer to [ResponseType].
  T? data;
}