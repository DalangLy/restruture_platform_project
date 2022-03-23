import 'package:dio/dio.dart';
import '../../../../config/env/app_enviroment.dart';
import '../../../../core/token/data/models/token_model.dart';

abstract class LoginRemoteDataSource{
  Future<TokenModel?> issueNewAccessToken({required TokenModel oldToken});
  Future<TokenModel> login({required String username, required String password,});
}

class LoginRemoteDataSourceImpl implements LoginRemoteDataSource{
  final Dio _dio;
  LoginRemoteDataSourceImpl({required Dio dio}) : _dio = dio;

  @override
  Future<TokenModel?> issueNewAccessToken({required TokenModel oldToken}) async {
    try{
      final response = await _dio.post(
        'http://192.168.100.81:8088/the-raccoon-passport/public/api/issue_new_access_token',
        data: {
          'refresh_token': oldToken.refreshToken,
        },
        onSendProgress: (count, total) {
          //print('count is : $count total is : $total');
        },
        onReceiveProgress: (count, total) {
          //print('1count is : $count total is : $total');
        },
        options: Options(
            sendTimeout: 2000,
            receiveTimeout: 3000,
            method: 'POST'
        ),
      );
      if(response.statusCode == 200){
        if(response.data['token_type'] == null){
          return null;
        }
        return TokenModel.fromJson(response.data);
      }
      throw Exception();
    }catch(e){
      throw Exception(e);
    }
  }

  @override
  Future<TokenModel> login({required String username, required String password}) async {
    try{
      final response = await _dio.post(
        '$baseUrl/identity/token',
        data: {
          'email': username,
          'password': password,
        },
      );
      if(response.statusCode == 200){
        return TokenModel.fromJson(response.data['data']);
      }
      throw Exception();
    }catch(e){
      throw Exception(e);
    }
  }
}