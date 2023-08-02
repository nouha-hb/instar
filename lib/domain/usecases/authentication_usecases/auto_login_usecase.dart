import 'package:dartz/dartz.dart';
import 'package:instar/domain/repositories/authentication_repository.dart';

import '../../../core/errors/failures/failures.dart';
import '../../entities/user.dart';


class AutoLoginUsecase {
  final AuthenticationRepository repository;

  const AutoLoginUsecase(this.repository);
  Future<Either<Failure, User>> call() async => await repository.autologin();
}
