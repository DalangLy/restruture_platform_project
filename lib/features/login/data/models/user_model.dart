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

  String toRawJson(){
    return json.encode(toJson());
  }

  factory UserModel.fromJson(Map<String, dynamic> json){
    return UserModel(
      id: json['id'].toString(),
      firstName: json['firstName'].toString(),
      lastName: json['lastName'],
      email: json['email'].toString(),
      isActive: json['isActive'],
      emailConfirmed: json['emailConfirmed'],
      phoneNumber: json['phoneNumber'],
      username: json['userName'],
    );
  }

  Map<String, dynamic> toJson(){
    return {
      'id': id,
      'name': firstName,
      'email': email,
    };
  }
}