import 'dart:convert';
import '../../domain/entities/token.dart';

class TokenModel extends Token{
  const TokenModel({
    required String token,
    required String refreshToken,
    required DateTime refreshTokenExpiryTime,
  }) : super(
    token: token,
    refreshToken: refreshToken,
    refreshTokenExpiryTime: refreshTokenExpiryTime,
  );

  factory TokenModel.fromRawJson({ required String jsonString }){
    try{
      return TokenModel.fromJson(json.decode(jsonString));
    }catch(e){
      throw Exception('convert to models error');
    }
  }

  String toRawJson(){
    return json.encode(toJson());
  }

  factory TokenModel.fromJson(Map<String, dynamic> json){
    return TokenModel(
      token: json['token'].toString(),
      refreshToken: json['refreshToken'].toString(),
      refreshTokenExpiryTime: DateTime.parse(json['refreshTokenExpiryTime']),
    );
  }

  Map<String, dynamic> toJson(){
    return {
      'token': token,
      'refreshToken': refreshToken,
      'refreshTokenExpiryTime': refreshTokenExpiryTime.toIso8601String(),
    };
  }
}