import 'package:equatable/equatable.dart';

import '../../domain/entities/token.dart';

class TokenModel extends Token {
  const TokenModel({required super.token, required super.refreshToken});

  factory TokenModel.fromJson(Map<String, dynamic> json) =>
      TokenModel(token: json['token'], refreshToken: json['refreshtoken']);

  Map<String, dynamic> toJson() =>
      {'token': token, 'refreshtoken': refreshToken};


}
