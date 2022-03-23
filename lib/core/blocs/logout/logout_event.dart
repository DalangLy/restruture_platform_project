part of 'logout_bloc.dart';

abstract class LogoutEvent extends Equatable {
  const LogoutEvent();
}

class Logout extends LogoutEvent {
  const Logout();

  @override
  List<Object> get props => [];
}