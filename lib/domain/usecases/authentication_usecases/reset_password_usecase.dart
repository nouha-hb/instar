import 'package:dartz/dartz.dart';
import 'package:instar/domain/repositories/authentication_repository.dart';

import '../../../core/errors/failures/failures.dart';


class ResetPasswordUsecase {
  final AuthenticationRepository repository;

  const ResetPasswordUsecase(this.repository);
  Future<Either<Failure, Unit>> call() async => await repository.Resetpassword(user);
}
