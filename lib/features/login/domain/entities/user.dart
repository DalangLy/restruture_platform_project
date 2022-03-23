import 'package:equatable/equatable.dart';

class User extends Equatable{
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final bool isActive;
  final bool emailConfirmed;
  final String phoneNumber;
  final String username;

  const User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.isActive,
    required this.emailConfirmed,
    required this.phoneNumber,
    required this.username
  });
  @override
  List<Object?> get props => [
    id,
    firstName,
    lastName,
    email,
    emailConfirmed,
    phoneNumber,
    username,
  ];
}