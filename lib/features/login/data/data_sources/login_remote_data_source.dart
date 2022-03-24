import 'package:dio/dio.dart';
import '../../../../config/env/app_enviroment.dart';
import '../../../../core/token/data/models/token_model.dart';
import 'i_login_remote_data_source.dart';



class LoginRemoteDataSource implements ILoginRemoteDataSource{
  final Dio _dio;
  LoginRemoteDataSource({required Dio dio}) : _dio = dio;

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
  Future<TokenModel> login({required Map<String, dynamic> data,}) async {
    try{
      final response = await _dio.post(
        '$baseUrl/oauth/token',
        data: data,
      );
      if(response.statusCode == 200){
        print(response.data);
        return TokenModel.fromJson(response.data);
      }
      throw Exception();
    }catch(e){
      throw Exception(e);
    }
  }
}