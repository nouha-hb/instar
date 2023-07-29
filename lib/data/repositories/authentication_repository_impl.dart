import 'package:dartz/dartz.dart';
import 'package:instar/core/errors/exceptions/exceptions.dart';

import 'package:instar/core/errors/failures/failures.dart';
import 'package:instar/data/data_Sources/remote_data_source/authentication_remote_data_source.dart';
import 'package:instar/data/models/user_model.dart';
import 'package:instar/domain/entities/user.dart';
import 'package:instar/domain/repositories/authentication_repository.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationRemoteDataSource authRemoteDataSource;
  const AuthenticationRepositoryImpl({
    required this.authRemoteDataSource,
  });
  
  @override
  Future<Either<Failure, Unit>> createAccount(User user) async{
     try{
      await authRemoteDataSource.createAccount(user);
      return const Right(unit);
    }on RegistrationException{
      return Left(RegistrationFailure());
    }

  }

  @override
  Future<Either<Failure, User>> login(
      {required String email, required String password}) {
    // TODO: implement login
    throw UnimplementedError();
  }

 @override
  Future<Either<Failure, User>> autologin() {
    // TODO: implement autologin
    throw UnimplementedError();
  }
  
  @override
  Future<Either<Failure, Unit>> emailVerification() {
    // TODO: implement emailVerification
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, User>> facebookLogin() {
    // TODO: implement facebookLogin
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, User>> googleLogin() {
    // TODO: implement googleLogin
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> resetPassword() {
    // TODO: implement resetPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> updateProfil(User user) {
    // TODO: implement updateProfil
    throw UnimplementedError();
  }
}
