import 'package:get_it/get_it.dart';

import '../features/login/data/data_sources/i_login_remote_data_source.dart';
import '../features/login/data/data_sources/login_remote_data_source.dart';
import '../features/login/data/repositories/login_repository.dart';
import '../features/login/domain/repositories/i_login_repository.dart';
import '../features/login/domain/use_cases/login_use_case.dart';
import '../features/login/presentation/bloc/login_bloc.dart';
class DILogin {
  final GetIt getIt;

  DILogin({required this.getIt}) {
    //***************************
    //********* Bloc ************
    getIt.registerFactory(() {
      return LoginBloc(
        getIt(),
      );
    });

    //******************************
    //********* Use Cases **********
    getIt.registerLazySingleton(() {
      return LoginUseCase(
        getIt(),
      );
    });

    //*********************************
    //********* Repositories **********
    getIt.registerLazySingleton<ILoginRepository>(() {
      return LoginRepository(
        getIt(),
        getIt(),
      );
    });

    //*********************************
    //********* Data Sources **********
    getIt.registerLazySingleton<ILoginRemoteDataSource>(() {
      return LoginRemoteDataSource(
        dio: getIt(),
      );
    });
  }
}