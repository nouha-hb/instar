import 'package:dartz/dartz.dart';
import 'package:instar/core/errors/exceptions/exceptions.dart';

import 'package:instar/core/errors/failures/failures.dart';
import 'package:instar/data/data_Sources/remote_data_source/authentication_remote_data_source.dart';
import 'package:instar/data/models/token_model.dart';
import 'package:instar/data/models/user_model.dart';
import 'package:instar/domain/entities/token.dart';
import 'package:instar/domain/entities/user.dart';
import 'package:instar/domain/repositories/authentication_repository.dart';

import '../data_Sources/local_data_source/authentication_local_data_source.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationRemoteDataSource authRemoteDataSource;
  final AuthenticationLocalDataSource authLocalDataSource;

  const AuthenticationRepositoryImpl(
      {required this.authRemoteDataSource, required this.authLocalDataSource});

  @override
  Future<Either<Failure, Unit>> createAccount(User user) async {
    try {
      await authRemoteDataSource.createAccount(user);
      return const Right(unit);
    } on RegistrationException {
      return Left(RegistrationFailure());
    }
  }

  @override
  Future<Either<Failure, Token>> login(
      {required String email, required String password}) async {
    try {
      TokenModel tm = await authRemoteDataSource.login(email, password);
      await authLocalDataSource.saveUserInformations(tm);
      Token t = Token(token: tm.token, refreshToken: tm.refreshToken);
      return right(t);
    } on LoginException catch (e) {
      return left(LoginFailure(e.message));
    } on LocalStorageException {
      return left(LocalStorageFailure());
    }
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
  Future<Either<Failure, Token>> googleLogin() async {
    try {
      final r = await authRemoteDataSource.googleLogin();
      return right(Token(token: r.token, refreshToken: r.refreshToken));
    } catch (e) {
      return left(Failure());
    }
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
