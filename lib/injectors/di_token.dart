import 'package:get_it/get_it.dart';
import '../core/token/data/data_sources/token_data_source.dart';

class DIToken {
  final GetIt getIt;

  //*****************************
  //********* TokenDataSource **********
  DIToken({required this.getIt}) {
    getIt.registerLazySingleton<TokenDataSource>(() {
      return TokenDataSourceImpl(tokenStorage: getIt());
    });
  }
}
