import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String name;
  final String email;
  final DateTime emailVerifiedAt;
  final String username;
  final DateTime createdAt;
  final DateTime updatedAt;

  const User(
    this.id,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.username,
    this.createdAt,
    this.updatedAt,
  );

  @override
  List<Object?> get props => [];
}
