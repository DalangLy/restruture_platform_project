import 'package:untitled1/core/error/unknown_failure.dart';

import '../../../../core/token/data/data_sources/token_data_source.dart';
import '../../../../core/token/data/models/token_model.dart';
import '../../domain/repositories/login_repository.dart';
import '../data_sources/login_remote_data_source.dart';

class LoginRepositoryImpl implements LoginRepository{
  final TokenDataSource _tokenDataSource;
  final LoginRemoteDataSource _loginRemoteDataSource;

  LoginRepositoryImpl({required TokenDataSource tokenDataSource, required LoginRemoteDataSource loginRemoteDataSource,}) : _tokenDataSource = tokenDataSource, _loginRemoteDataSource = loginRemoteDataSource;

  @override
  Future<bool> login({required String username, required String password}) async {
    try{
      final TokenModel token = await _loginRemoteDataSource.login(username: username, password: password,);
      await _tokenDataSource.storeToken(newToken: token);
      return true;
    }catch(e){
      throw UnknownFailure(message: e.toString(),);
    }
  }
}