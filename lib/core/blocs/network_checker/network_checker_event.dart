part of 'network_checker_bloc.dart';

abstract class NetworkCheckerEvent extends Equatable {
  const NetworkCheckerEvent();
}

class CheckNetworkStatus extends NetworkCheckerEvent {
  const CheckNetworkStatus();

  @override
  List<Object> get props => [];
}

class TriggerOnlineStatus extends NetworkCheckerEvent {
  final String type;
  const TriggerOnlineStatus({required this.type,});

  @override
  List<Object> get props => [];
}

class TriggerOfflineStatus extends NetworkCheckerEvent {
  const TriggerOfflineStatus();

  @override
  List<Object> get props => [];
}