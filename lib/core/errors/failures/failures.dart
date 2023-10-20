// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  String? message;
  @override
  List<Object?> get props => [];
}

class ServerFailure extends Failure {
  final String? message;

  ServerFailure({this.message});
}

class ConnectionFailure extends Failure {}

class RegistrationFailure extends Failure {}

class LoginFailure extends Failure {
  final String message;

  LoginFailure(this.message);
}

class ProductNotFoundFailure extends Failure {}

class LocalStorageFailure extends Failure {}

class NotAuthorizedFailure extends Failure {}


