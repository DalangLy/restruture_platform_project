import 'dart:convert';
import '../../domain/entities/token.dart';

class TokenModel extends Token {
  const TokenModel(
    String tokenType,
    DateTime expiresIn,
    String accessToken,
    String refreshToken,
  ) : super(
          tokenType,
          expiresIn,
          accessToken,
          refreshToken,
        );

  factory TokenModel.fromRawJson({ required String jsonString }){
    try{
      return TokenModel.fromJson(json.decode(jsonString));
    }catch(e){
      throw Exception('convert to models error');
    }
  }

  factory TokenModel.fromJson(Map<String, dynamic> json){
    return TokenModel(
      json['token_type'].toString(),
      DateTime.fromMicrosecondsSinceEpoch(((json['expires_in'] as num).toInt() * 1000)),
      json['access_token'].toString(),
      json['refresh_token'] as String,
    );
  }

  String toRawJson(){
    return json.encode(toJson());
  }

  Map<String, dynamic> toJson(){
    return {
      'token_type': tokenType,
      'expires_in': expiresIn,
      'access_token': accessToken,
      'refresh_token': refreshToken,
    };
  }
}
