import 'package:get_it/get_it.dart';
import 'package:untitled1/injectors/di_external_resource.dart';
import 'package:untitled1/injectors/di_login.dart';
import 'package:untitled1/injectors/di_start_up.dart';
import 'package:untitled1/injectors/di_token.dart';

final getIt = GetIt.instance;

Future<void> injector() async {
  DIExternalResource(getIt: getIt,);
  DIStartUp(getIt: getIt);
  DIToken(getIt: getIt,);
  DILogin(getIt: getIt,);
}