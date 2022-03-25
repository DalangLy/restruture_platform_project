import 'dart:convert';
import '../../domain/entities/user.dart';

class UserModel extends User {
  const UserModel(
    String id,
    String name,
    String email,
    DateTime emailVerifiedAt,
    String username,
    DateTime createdAt,
    DateTime updatedAt,
  ) : super(
          id,
          name,
          email,
          emailVerifiedAt,
          username,
          createdAt,
          updatedAt,
        );

  factory UserModel.fromRawJson({ required String jsonString }){
    return UserModel.fromJson(json.decode(jsonString));
  }

  factory UserModel.fromJson(Map<String, dynamic> json){
    return UserModel(
      json['id'] as String,
      json['name'] as String,
      json['email'] as String,
      DateTime.parse(json['email_verified_at'] as String),
      json['username'] as String,
      DateTime.parse(json['created_at'] as String),
      DateTime.parse(json['updated_at'] as String),
    );
  }
}
