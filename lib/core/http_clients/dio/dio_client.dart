import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:untitled1/core/error/unknown_failure.dart';

import '../../abstractions/http/a_http_client.dart';

class DioClient implements AHttpClient{
  final Dio _dio;

  DioClient({ required Dio dio }) : _dio = dio;

  @override
  Future<AResponse> getAPI(String path, {AOptions? options}) async{
    try{
      final Response response = await _dio.get(
        path,
        options: Options(
          headers: options!.headers,
        ),
      );

      final Map<String, dynamic> apiDataInJson;
      if(response.data is String){
        apiDataInJson = json.decode(response.data);
      }else{
        apiDataInJson = response.data;
      }
      return AResponse(
        statusCode: response.statusCode,
        data: apiDataInJson,
      );
    }on DioError catch(e){
      if(e.response != null){
        return AResponse(
          statusCode: e.response!.statusCode,
        );
      }
      else if(e.type == DioErrorType.connectTimeout){
        throw UnknownFailure(message: 'Request Timeout');
      }
      throw Exception(e);
    }
  }

  @override
  Future<AResponse> postAPI(String path, {required dynamic body, AOptions? options}) async{
    try {
      final Response response = await _dio.post(
        path,
        data: body,
        options: Options(
          headers: options!.headers,
        ),
      );
      final Map<String, dynamic> apiDataInJson;
      if(response.data is String){
        apiDataInJson = json.decode(response.data);
      }else{
        apiDataInJson = response.data;
      }
      return AResponse(
        statusCode: response.statusCode,
        data: apiDataInJson,
      );
    } on DioError catch(e){
      if(e.response != null){
        return AResponse(
          statusCode: e.response!.statusCode,
        );
      }
      throw Exception(e);
    }
  }

  @override
  Future<AResponse> deleteAPI(String path, {required Map<String, dynamic> body, AOptions? options}) async{
    try {
      final Response response = await _dio.delete(
        path,
        data: body,
        options: Options(
          headers: options!.headers,
        ),
      );
      final Map<String, dynamic> apiDataInJson;
      if(response.data is String){
        apiDataInJson = json.decode(response.data);
      }else{
        apiDataInJson = response.data;
      }
      return AResponse(
        statusCode: response.statusCode,
        data: apiDataInJson,
      );
    } on DioError catch(e){
      if(e.response != null){
        return AResponse(
          statusCode: e.response!.statusCode,
        );
      }
      throw Exception(e);
    }
  }

  @override
  Future<AResponse> putAPI(String path, {required Map<String, dynamic> body, AOptions? options}) async{
    try {
      final Response response = await _dio.put(
        path,
        data: body,
        options: Options(
          headers: options!.headers,
        ),
      );
      final Map<String, dynamic> apiDataInJson;
      if(response.data is String){
        apiDataInJson = json.decode(response.data);
      }else{
        apiDataInJson = response.data;
      }
      return AResponse(
        statusCode: response.statusCode,
        data: apiDataInJson,
      );
    } on DioError catch(e){
      if(e.response != null){
        return AResponse(
          statusCode: e.response!.statusCode,
        );
      }
      throw Exception(e);
    }
  }
}

