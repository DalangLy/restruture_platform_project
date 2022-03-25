part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();
}

class LoginInitial extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginInProgress extends LoginState{
  @override
  List<Object?> get props => [];
}

class LoginSuccess extends LoginState{
  @override
  List<Object?> get props => [];
}

class LoginFailed extends LoginState{
  @override
  List<Object?> get props => [];
}