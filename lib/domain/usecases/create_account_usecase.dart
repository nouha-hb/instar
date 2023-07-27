import 'package:dartz/dartz.dart';
import 'package:instar/domain/repositories/authentication_repository.dart';

import '../../core/errors/failures/failures.dart';

class CreateAccountUsecase {
  final AuthenticationRepository repository;

  const CreateAccountUsecase(this.repository);
  Future<Either<Failure, Unit>> call() => repository.createAccount();
}
