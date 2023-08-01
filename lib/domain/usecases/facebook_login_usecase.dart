import 'package:dartz/dartz.dart';
import 'package:instar/domain/repositories/authentication_repository.dart';

import '../../core/errors/failures/failures.dart';
import '../entities/user.dart';

class FacebookLoginUsecase {
  final AuthenticationRepository repository;

  const FacebookLoginUsecase(this.repository);
  Future<Either<Failure, User>> call() async => await repository.facebookLogin();
}