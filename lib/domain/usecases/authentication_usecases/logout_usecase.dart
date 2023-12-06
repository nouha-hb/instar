import 'package:dartz/dartz.dart';
import 'package:instar/domain/repositories/authentication_repository.dart';

import '../../../core/errors/failures/failures.dart';

class LogoutUsecase {
  final AuthenticationRepository repository;

  const LogoutUsecase(this.repository);
  Future<Either<Failure, Unit>> call() async => await repository.logout();
}
