import 'package:equatable/equatable.dart';

class Token extends Equatable {
  final String tokenType;
  final DateTime expiresIn;
  final String accessToken;
  final String refreshToken;

  const Token(
    this.tokenType,
    this.expiresIn,
    this.accessToken,
    this.refreshToken,
  );

  @override
  List<Object?> get props => [];
}
