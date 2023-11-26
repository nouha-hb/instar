import 'package:dartz/dartz.dart';
import 'package:instar/domain/repositories/authentication_repository.dart';

import '../../../core/errors/failures/failures.dart';
import '../../entities/token.dart';


class FacebookLoginUsecase {
  final AuthenticationRepository repository;

  const FacebookLoginUsecase(this.repository);
  Future<Either<Failure, Token>> call() async => await repository.facebookLogin();
}