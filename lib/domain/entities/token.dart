import 'package:equatable/equatable.dart';

class Token extends Equatable {
  final String token;
  final String refreshToken;

  const Token({required this.token, required this.refreshToken});
  @override
  List<Object?> get props => [token, refreshToken];}