import '../../../../core/token/data/models/token_model.dart';

abstract class ILoginRemoteDataSource{
  Future<TokenModel?> issueNewAccessToken({required TokenModel oldToken});
  Future<TokenModel> login({required Map<String, dynamic> data,});
}