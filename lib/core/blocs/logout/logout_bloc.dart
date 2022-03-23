import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'logout_event.dart';
part 'logout_state.dart';

class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {
  LogoutBloc() : super(LogoutInitial()) {
    on<LogoutEvent>((event, emit) async{
      if(event is Logout){
        emit(const LogoutInProgress(),);
        await Future.delayed(const Duration(seconds: 2,),);
        emit(const LogoutSuccess());
      }
    });
  }
}
