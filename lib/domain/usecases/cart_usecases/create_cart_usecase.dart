import 'package:dartz/dartz.dart';
import 'package:instar/domain/repositories/cart_repository.dart';


import '../../../core/errors/failures/failures.dart';

class CreateCartUsecase {
  final CartRepository _repository;

  CreateCartUsecase(this._repository);

  Future<Either<Failure, Unit>> call({required String userId}) async =>
      await _repository.createCart(userId: userId);
}
