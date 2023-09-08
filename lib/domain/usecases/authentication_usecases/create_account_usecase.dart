import 'package:dartz/dartz.dart';
import 'package:instar/domain/repositories/authentication_repository.dart';

import '../../../core/errors/failures/failures.dart';
import '../../entities/user.dart';

class CreateAccountUsecase {
  final AuthenticationRepository repository;

  CreateAccountUsecase(this.repository);
  Future<Either<Failure, String>> call(User user) async =>
      await repository.createAccount(user);
}
