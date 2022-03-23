part of 'network_checker_bloc.dart';

abstract class NetworkCheckerState extends Equatable {
  const NetworkCheckerState();
}

class NetworkCheckerInitial extends NetworkCheckerState {
  @override
  List<Object> get props => [];
}

class IsOnline extends NetworkCheckerState {
  final String type;
  const IsOnline({required this.type,});

  @override
  List<Object> get props => [];
}

class IsOffline extends NetworkCheckerState {
  const IsOffline();

  @override
  List<Object> get props => [];
}