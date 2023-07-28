import 'package:dartz/dartz.dart';
import 'package:instar/domain/repositories/authentication_repository.dart';

import '../../core/errors/failures/failures.dart';

class EmailVerificationUsecase {
  final AuthenticationRepository repository;

  const EmailVerificationUsecase(this.repository);
  Future<Either<Failure, Unit>> call() async => await repository.emailVerification();
}
