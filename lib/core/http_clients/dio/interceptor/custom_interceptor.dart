import 'dart:io';
import 'package:dio/dio.dart';
import 'dio_connectivity_request_retry.dart';

class CustomInterceptor extends Interceptor{
  final DioConnectivityRequestRetry _dioConnectivityRequestRetry;

  CustomInterceptor({required DioConnectivityRequestRetry dioConnectivityRequestRetry}) : _dioConnectivityRequestRetry = dioConnectivityRequestRetry;

  @override
  Future<void> onError(DioError err, ErrorInterceptorHandler handler) async {
    if(_shouldRetry(err)){
      try{
        return handler.resolve(await _dioConnectivityRequestRetry.scheduleRequestRetry(err.requestOptions));
      }
      catch(ex){
        return  handler.next(err);//continue
      }
    }
    // print('Dalang ERROR[${err.get?.statusCode}] => PATH: ${err.requestOptions.path}');
    return super.onError(err, handler);
  }

  bool _shouldRetry(DioError err) {
    return err.type == DioErrorType.other &&
        err.error != null &&
        err.error is SocketException;
  }
}