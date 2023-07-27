import 'package:dartz/dartz.dart';
import 'package:instar/domain/repositories/authentication_repository.dart';

import '../../core/errors/failures/failures.dart';
import '../entities/user.dart';

class UpdateProfilUsecase {
  final AuthenticationRepository repository;

  const UpdateProfilUsecase(this.repository);
  Future<Either<Failure, Unit>> call(User user) async => await repository.updateProfil(user);
}
