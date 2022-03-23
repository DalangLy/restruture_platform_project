abstract class AHttpClient{
  Future<AResponse> getAPI(String path, {AOptions? options});
  Future<AResponse> postAPI(String path, {required Map<String, dynamic> body, AOptions? options});
  Future<AResponse> deleteAPI(String path, {required Map<String, dynamic> body, AOptions? options});
  Future<AResponse> putAPI(String path, {required Map<String, dynamic> body, AOptions? options});
}

class AOptions{
  Map<String, dynamic>? headers = {
    'accept': 'application/json',
    'Content-Type': 'application/json',
  };

  AOptions({this.headers});
}

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