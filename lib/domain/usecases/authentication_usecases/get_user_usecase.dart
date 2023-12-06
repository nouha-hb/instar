import 'package:dartz/dartz.dart';
import 'package:instar/domain/repositories/authentication_repository.dart';

import '../../../core/errors/failures/failures.dart';
import '../../entities/user.dart';

class GetUserUsecase {
  final AuthenticationRepository repository;
  const GetUserUsecase(this.repository);
  Future<Either<Failure, User>> call(String id) async =>
      await repository.getUser(id);
}
