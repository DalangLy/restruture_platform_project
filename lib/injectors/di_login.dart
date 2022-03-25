import 'package:get_it/get_it.dart';

import '../features/auth/data/data_sources/i_login_remote_data_source.dart';
import '../features/auth/data/data_sources/login_remote_data_source.dart';
import '../features/auth/data/repositories/login_repository.dart';
import '../features/auth/domain/repositories/i_login_repository.dart';
import '../features/auth/domain/use_cases/login_use_case.dart';
import '../features/auth/presentation/bloc/login_bloc.dart';

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