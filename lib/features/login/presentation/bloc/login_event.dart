part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class Login extends LoginEvent{
  final Map<String, dynamic> data;
  const Login({required this.data,});

  @override
  List<Object?> get props => [];
}