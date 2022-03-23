import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';

part 'network_checker_event.dart';
part 'network_checker_state.dart';

class NetworkCheckerBloc extends Bloc<NetworkCheckerEvent, NetworkCheckerState> {
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  NetworkCheckerBloc() : super(NetworkCheckerInitial()) {
    on<NetworkCheckerEvent>((event, emit) async{
      if(event is CheckNetworkStatus){
        _connectivitySubscription =  Connectivity().onConnectivityChanged.listen((ConnectivityResult result) async{
          if(result == ConnectivityResult.mobile){
            add(const TriggerOnlineStatus(type: 'Cellular'),);
          }
          if(result == ConnectivityResult.wifi){
            add(const TriggerOnlineStatus(type: 'Wifi'),);
          }
          else{
            add(const TriggerOfflineStatus(),);
          }
        });
      }
      else if(event is TriggerOnlineStatus){
        emit(IsOnline(type: event.type));
      }
      else if(event is TriggerOfflineStatus){
        emit(const IsOffline());
      }
    });
  }

  @override
  Future<void> close() {
    _connectivitySubscription.cancel();
    return super.close();
  }
}
