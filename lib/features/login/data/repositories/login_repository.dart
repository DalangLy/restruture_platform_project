import 'package:untitled1/core/error/unknown_failure.dart';
import '../../../../core/token/data/data_sources/token_data_source.dart';
import '../../../../core/token/data/models/token_model.dart';
import '../../domain/repositories/i_login_repository.dart';
import '../data_sources/i_login_remote_data_source.dart';

class LoginRepository implements ILoginRepository{
  final TokenDataSource _tokenDataSource;
  final ILoginRemoteDataSource _loginRemoteDataSource;

  LoginRepository(this._tokenDataSource, this._loginRemoteDataSource,);

  @override
  Future<bool> login({required Map<String, dynamic> data,}) async {
    try{
      final TokenModel token = await _loginRemoteDataSource.login(data: data,);
      await _tokenDataSource.storeToken(newToken: token);
      return true;
    }catch(e){
      throw UnknownFailure(message: e.toString(),);
    }
  }
}