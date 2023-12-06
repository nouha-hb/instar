import 'package:dartz/dartz.dart';
import 'package:instar/domain/entities/token.dart';
import 'package:instar/domain/repositories/authentication_repository.dart';

import '../../../core/errors/failures/failures.dart';


class AutoLoginUsecase {
  final AuthenticationRepository repository;

  const AutoLoginUsecase(this.repository);
  Future<Either<Failure, Token>> call() async => await repository.autologin();
}
