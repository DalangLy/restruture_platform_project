import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/abstractions/http/a_http_client.dart';
import '../core/http_clients/dio/dio_client.dart';
import '../core/http_clients/dio/interceptor/dio_with_interceptor.dart';
import '../core/token/data/data_sources/storages/token_storage.dart';

class DIExternalResource {
  final GetIt getIt;

  DIExternalResource({required this.getIt}) {
    //*****************************
    //********* Shared Preferences **********
    getIt.registerLazySingleton((){
      return SharedPreferences.getInstance();
    });

    //*****************************
    //********* Flutter Secure Storage **********
    getIt.registerLazySingleton((){
      return const FlutterSecureStorage();
    });

    //*****************************
    //********* Dio **********
    getIt.registerLazySingleton<AHttpClient>(() {
      return DioClient(
        dio: getIt(),
      );
    });

    //*****************************
    //********* Dio Interceptor Auto Retry **********
    getIt.registerLazySingleton(() {
      return DioWithInterceptor(
        dio: Dio(),
        connectivity: getIt(),
      ).setUp();
    });

    //*****************************
    //********* Connectivity **********
    getIt.registerLazySingleton(() {
      return Connectivity();
    });

    //*****************************
    //********* Token Storage **********
    getIt.registerLazySingleton(() {
      return TokenStorage(secureStorage: getIt(), sharedPreferences: getIt(),);
    });

    //*****************************
    //********* Object Box **********
    // getIt.registerSingletonAsync(
    //       () async {
    //     final Directory dir = await getApplicationDocumentsDirectory();
    //     return Store(
    //       getObjectBoxModel(),
    //       directory: join(dir.path, 'objectBoxDB'),
    //     );
    //   }, //f// or object b
    // );
    // if(!kIsWeb){
    //   getIt.registerLazySingleton(() {
    //     return ObjectBoxStorage();
    //   });
    // }
  }
}