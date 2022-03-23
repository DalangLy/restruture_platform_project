import '../../../error/failure.dart';
import '../models/token_model.dart';
import 'storages/token_storage.dart';

abstract class TokenDataSource{
  Future<TokenModel> checkTokenInStorage();
  Future<void> storeToken({required TokenModel newToken,});
  Future<void> removeToken();
  Future<TokenModel> getAccessToken();
}

// Error for Token Storage Only
class NoTokenFound extends Failure{
  const NoTokenFound({required String message,}) : super(message: message,);
}

class TokenDataSourceImpl implements TokenDataSource {
  final TokenStorage _tokenStorage;
  static const String _authKey = 'login';
  TokenDataSourceImpl({
    required TokenStorage tokenStorage,
  }) : _tokenStorage = tokenStorage;

  @override
  Future<TokenModel> checkTokenInStorage() async {
    try {
      final String token = await _tokenStorage.read(key: _authKey);
      if (token.isEmpty) {
        throw const NoTokenFound(message: 'No Token Found');
      }
      return TokenModel.fromRawJson(jsonString: token);
    } catch (e) {
      _tokenStorage.delete(key: _authKey);
      rethrow;
    }
  }

  @override
  Future<void> storeToken({required TokenModel newToken}) async {
    try {
      await _tokenStorage.write(key: _authKey, value: newToken.toRawJson());
    }
    catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> removeToken() async {
    try {
      await _tokenStorage.delete(key: _authKey);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<TokenModel> getAccessToken() async {
    try {
      final String token = await _tokenStorage.read(key: _authKey);
      if (token.isEmpty) {
        throw const NoTokenFound(message: 'No Token Found');
      }
      return TokenModel.fromRawJson(jsonString: token);
    } catch (e) {
      _tokenStorage.delete(key: _authKey);
      throw Exception(e);
    }
  }
}
