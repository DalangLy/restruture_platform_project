import 'dart:convert';
import '../../domain/entities/user.dart';

class UserModel extends User{
  const UserModel({
    required String id,
    required String firstName,
    required String lastName,
    required String email,
    required bool isActive,
    required bool emailConfirmed,
    required String phoneNumber,
    required String username,
  }) : super(
    id: id,
    firstName: firstName,
    lastName: lastName,
    email: email,
    isActive: isActive,
    emailConfirmed: emailConfirmed,
    phoneNumber: phoneNumber,
    username: username,
  );

  factory UserModel.fromRawJson({ required String jsonString }){
    return UserModel.fromJson(json.decode(jsonString));
  }

  factory UserModel.fromJson(Map<String, dynamic> json){
    return UserModel(
      id: json['id'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      email: json['email'] as String,
      isActive: json['isActive'] as bool,
      emailConfirmed: json['emailConfirmed'] as bool,
      phoneNumber: json['phoneNumber'] as String,
      username: json['userName'] as String,
    );
  }
}