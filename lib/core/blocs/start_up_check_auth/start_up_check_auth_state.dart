part of 'start_up_check_auth_bloc.dart';

abstract class StartUpCheckAuthState extends Equatable {
  const StartUpCheckAuthState();
}

class StartUpCheckAuthInitial extends StartUpCheckAuthState {
  @override
  List<Object> get props => [];
}

class CheckAuthInProgress extends StartUpCheckAuthState {
  const CheckAuthInProgress();

  @override
  List<Object> get props => [];
}

class CheckAuthSuccess extends StartUpCheckAuthState {
  const CheckAuthSuccess();
  @override
  List<Object> get props => [];
}

class CheckAuthFailed extends StartUpCheckAuthState {
  final String message;
  const CheckAuthFailed({required this.message,});

  @override
  List<Object> get props => [];
}