import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  String? message;
  @override
  List<Object?> get props => [];
}

class ServerFailure extends Failure {}

class ConnectionFailure extends Failure {}

class RegistrationFailure extends Failure {}
class ForgetPasswordnFailure extends Failure {}
class VerifCodeFailure extends Failure {}
class ResetpasswordFailure extends Failure {}



class LoginFailure extends Failure {
  final String message;

  LoginFailure(this.message);
}

class ProductNotFoundFailure extends Failure {}

class LocalStorageFailure extends Failure {}
