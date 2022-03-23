import 'a_options.dart';
import 'a_response.dart';

abstract class AHttpClient{
  Future<AResponse> getAPI(String path, {AOptions? options});
  Future<AResponse> postAPI(String path, {required Map<String, dynamic> body, AOptions? options});
  Future<AResponse> deleteAPI(String path, {required Map<String, dynamic> body, AOptions? options});
  Future<AResponse> putAPI(String path, {required Map<String, dynamic> body, AOptions? options});
}