import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/use_cases/login_use_case.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase _loginUseCase;
  LoginBloc(this._loginUseCase,) : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async{
      if(event is Login){
        emit(LoginInProgress());
        try{
          final bool data = await _loginUseCase(data: event.data);
          emit(LoginSuccess());
        }catch(e){
          emit(LoginFailed());
        }
      }
    });
  }

  void login({required Map<String, dynamic> data,}){
    add(Login(data: data,),);
  }
}
