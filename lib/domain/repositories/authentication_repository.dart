import 'package:dartz/dartz.dart';
import 'package:instar/domain/entities/user.dart';

import '../../core/errors/failures/failures.dart';

abstract class AuthenticationRepository {
  Future<Either<Failure,Unit>> createAccount(User user);
  Future<Either<Failure,User>> login({required String email,required String password});
  Future<Either<Failure,User>> autologin();
  Future<Either<Failure,Unit>> updateProfil(User user);
  Future<Either<Failure,Unit>> logout();
  Future<Either<Failure,User>> facebookLogin();
  Future<Either<Failure,User>> googleLogin();
  Future<Either<Failure,Unit>> resetPassword();
  Future<Either<Failure,Unit>> emailVerification();

}
