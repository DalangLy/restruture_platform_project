import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import '../../token/data/data_sources/token_data_source.dart';
import '../../token/data/models/token_model.dart';

part 'start_up_check_auth_event.dart';
part 'start_up_check_auth_state.dart';

class StartUpCheckAuthBloc extends Bloc<StartUpCheckAuthEvent, StartUpCheckAuthState> {
  final Dio _httpClient;
  final TokenDataSource _tokenDataSource;
  StartUpCheckAuthBloc({required Dio httpClient, required TokenDataSource tokenDataSource,}) : _httpClient = httpClient, _tokenDataSource = tokenDataSource, super(StartUpCheckAuthInitial()) {
    on<StartUpCheckAuthEvent>((event, emit) async{
      if(event is CheckAuth){
        emit(const CheckAuthInProgress());
        final TokenModel f = await _tokenDataSource.checkTokenInStorage();
        if(f.token.isNotEmpty){
          emit(const CheckAuthSuccess(),);
        }
        else{
          emit(const CheckAuthFailed(message: 'Unauthenticated'));
        }
      }
    });
  }
}
