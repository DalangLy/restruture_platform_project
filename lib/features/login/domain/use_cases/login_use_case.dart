import '../repositories/login_repository.dart';

class LoginUseCase{
  final LoginRepository _loginRepository;
  LoginUseCase({required LoginRepository loginRepository,}) : _loginRepository = loginRepository;

  Future<bool> call({required String username, required String password,}){
    return _loginRepository.login(username: username, password: password,);
  }
}