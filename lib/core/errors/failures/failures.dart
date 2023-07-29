import 'package:equatable/equatable.dart';

class Failure extends Equatable{
  @override
  List<Object?> get props => [];

}

class ServerFailure extends Failure{}
class ConnectionFailure extends Failure{}
class RegistrationFailure extends Failure{}
class LoginFailure extends Failure{}

