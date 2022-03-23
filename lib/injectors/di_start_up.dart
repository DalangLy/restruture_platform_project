import 'package:get_it/get_it.dart';

import '../core/blocs/language_switcher/language_switcher_bloc.dart';
import '../core/blocs/start_up_check_auth/start_up_check_auth_bloc.dart';
import '../core/blocs/theme_switcher/theme_switcher_bloc.dart';

class DIStartUp{
  final GetIt getIt;
  DIStartUp({required this.getIt,}){
    /****************************************
     *********** Theme Switcher ***********
     *****************************************/
    getIt.registerFactory(() {
      return ThemeSwitcherBloc(
        localStorage: getIt(),
      );
    });
    /****************************************
     *********** Language Switcher ***********
     *****************************************/
    getIt.registerFactory(() {
      return LanguageSwitcherBloc(
        localStorage: getIt(),
      );
    });
    /****************************************
     *********** Auth Checker ***********
     *****************************************/
    getIt.registerFactory(() {
      return StartUpCheckAuthBloc(
        httpClient: getIt(),
        tokenDataSource: getIt(),
      );
    });
  }
}