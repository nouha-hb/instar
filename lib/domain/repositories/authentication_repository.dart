import 'package:dartz/dartz.dart';
import 'package:instar/domain/entities/token.dart';
import 'package:instar/domain/entities/user.dart';

import '../../core/errors/failures/failures.dart';

abstract class AuthenticationRepository {
  Future<Either<Failure,Unit>> createAccount(User user);
  Future<Either<Failure,Token>> login({required String email,required String password});
  Future<Either<Failure,Token>> autologin();
  Future<Either<Failure,Unit>> updateProfil(User user);
  Future<Either<Failure,Unit>> logout();
  Future<Either<Failure,Token>> facebookLogin();
  Future<Either<Failure,Token>> googleLogin();
  Future<Either<Failure,Unit>> resetPassword();
  Future<Either<Failure,Unit>> emailVerification();
  Future<Either<Failure,User>> getUser(String id);


}
