import 'package:dartz/dartz.dart';
import 'package:instar/domain/entities/token.dart';
import 'package:instar/domain/repositories/authentication_repository.dart';
import '../../../core/errors/failures/failures.dart';


class LoginUsecase {
  final AuthenticationRepository repository;

  const LoginUsecase(this.repository);
  Future<Either<Failure, Token>> call({required String email,required String password}) async => await repository.login(email: email,password: password);
}
