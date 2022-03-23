import '../repositories/i_login_repository.dart';

class LoginUseCase{
  final ILoginRepository _loginRepository;
  LoginUseCase(this._loginRepository,);

  Future<bool> call({required Map<String, dynamic> data,}){
    return _loginRepository.login(data: data,);
  }
}