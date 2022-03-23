import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';

import 'custom_interceptor.dart';
import 'dio_connectivity_request_retry.dart';

class DioWithInterceptor{
  final Dio _dio;
  final Connectivity _connectivity;

  DioWithInterceptor({required Dio dio, required Connectivity connectivity}) : _dio = dio, _connectivity = connectivity;

  Dio setUp(){
    _dio.options.connectTimeout = 10000;
    _dio.options.receiveTimeout = 5000;
    _dio.interceptors.add(CustomInterceptor(dioConnectivityRequestRetry: DioConnectivityRequestRetry(connectivity: _connectivity, dio: _dio,),),);
    return _dio;
  }
}