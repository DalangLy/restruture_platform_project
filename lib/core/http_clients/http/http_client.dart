import '../../abstractions/http/a_http_client.dart';

class HttpClient implements AHttpClient{
  @override
  Future<AResponse> deleteAPI(String path, {required Map<String, dynamic> body, AOptions? options}) {
    // TODO: implement deleteAPI
    throw UnimplementedError();
  }

  @override
  Future<AResponse> getAPI(String path, {AOptions? options}) {
    // TODO: implement getAPI
    throw UnimplementedError();
  }

  @override
  Future<AResponse> postAPI(String path, {required Map<String, dynamic> body, AOptions? options}) {
    // TODO: implement postAPI
    throw UnimplementedError();
  }

  @override
  Future<AResponse> putAPI(String path, {required Map<String, dynamic> body, AOptions? options}) {
    // TODO: implement putAPI
    throw UnimplementedError();
  }
}