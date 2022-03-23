part of 'logout_bloc.dart';

abstract class LogoutState extends Equatable {
  const LogoutState();
}

class LogoutInitial extends LogoutState {
  @override
  List<Object> get props => [];
}

class LogoutInProgress extends LogoutState {
  const LogoutInProgress();

  @override
  List<Object> get props => [];
}

class LogoutSuccess extends LogoutState {
  const LogoutSuccess();

  @override
  List<Object> get props => [];
}