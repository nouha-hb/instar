import 'package:dartz/dartz.dart';
import 'package:instar/domain/entities/token.dart';
import 'package:instar/domain/repositories/authentication_repository.dart';

import '../../../core/errors/failures/failures.dart';
import '../../entities/user.dart';


class GoogleLoginUsecase {
  final AuthenticationRepository repository;

  const GoogleLoginUsecase(this.repository);
  Future<Either<Failure, Token>> call() async => await repository.googleLogin();
}
