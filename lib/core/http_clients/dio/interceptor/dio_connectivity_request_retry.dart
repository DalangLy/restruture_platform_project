import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';

class DioConnectivityRequestRetry{
  final Dio _dio;
  final Connectivity _connectivity;

  DioConnectivityRequestRetry({required Dio dio, required Connectivity connectivity, }) : _dio = dio, _connectivity = connectivity;

  Future<Response> scheduleRequestRetry(RequestOptions requestOptions) async {
    late StreamSubscription streamSubscription;
    final responseCompleter = Completer<Response>();

    streamSubscription = _connectivity.onConnectivityChanged.listen(
          (connectivityResult) {
        if (connectivityResult != ConnectivityResult.none) {
          streamSubscription.cancel();
          responseCompleter.complete(
            _dio.request(
              requestOptions.path,
              cancelToken: requestOptions.cancelToken,
              data: requestOptions.data,
              onReceiveProgress: requestOptions.onReceiveProgress,
              onSendProgress: requestOptions.onSendProgress,
              queryParameters: requestOptions.queryParameters,
              options: Options(
                method: requestOptions.method,
                headers: requestOptions.headers,
                contentType: requestOptions.contentType,
                extra: requestOptions.extra,
                responseType: requestOptions.responseType,
                requestEncoder: requestOptions.requestEncoder,
                responseDecoder: requestOptions.responseDecoder,
                sendTimeout: requestOptions.sendTimeout,
                validateStatus: requestOptions.validateStatus,
                receiveTimeout: requestOptions.receiveTimeout,
                followRedirects: requestOptions.followRedirects,
                listFormat: requestOptions.listFormat,
                maxRedirects: requestOptions.maxRedirects,
                receiveDataWhenStatusError: requestOptions.receiveDataWhenStatusError,
              ),
            ),
          );
        }
      },
    );

    return responseCompleter.future;
  }
}