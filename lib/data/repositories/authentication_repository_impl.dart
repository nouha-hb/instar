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

// ! completed
  @override
  Future<Either<Failure, Token>> googleLogin() async {
    try {
      TokenModel _tm  = await authRemoteDataSource.googleLogin();
       await authLocalDataSource.saveUserInformations(_tm);
      Token t = Token(token: _tm.token, refreshToken: _tm.refreshToken);
      return right(t);
    } on LoginException catch (e) {
      return left(LoginFailure(e.message));
    } on LocalStorageException {
      return left(LocalStorageFailure());
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
  Future<Either<Failure, Unit>> updateProfil(User user) async {
    try {
      await authRemoteDataSource.updateProfil(user);
      return const Right(unit);
    }on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, User>> getUser(String id) async {
    try {
      final model = await authRemoteDataSource.getcurrentUser(id);
      return Right(User(
          ban: model.ban,
          number: model.number,
          role: model.role,
          firstName: model.firstName,
          lastName: model.lastName,
          email: model.email,
          phone: model.phone,
          password: model.password));
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }
}
