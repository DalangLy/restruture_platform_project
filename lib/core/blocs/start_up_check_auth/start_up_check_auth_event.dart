part of 'start_up_check_auth_bloc.dart';

abstract class StartUpCheckAuthEvent extends Equatable {
  const StartUpCheckAuthEvent();
}


class CheckAuth extends StartUpCheckAuthEvent {
  const CheckAuth();

  @override
  List<Object> get props => [];
}