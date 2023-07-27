import 'package:dartz/dartz.dart';
import 'package:instar/domain/entities/user.dart';

import '../../core/errors/failures/failures.dart';

abstract class AuthenticationRepository {
  Future<Either<Failure,Unit>> createAccount();
  Future<Either<Failure,User>> login({String email,String password});
  Future<Either<Failure,User>> autologin();
  Future<Either<Failure,Unit>> updateProfile(User user);
  Future<Either<Failure,Unit>> logout();
  Future<Either<Failure,User>> facebookLogin();
  Future<Either<Failure,User>> googleLogin();
}
