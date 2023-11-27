import 'package:dartz/dartz.dart';
import 'package:instar/domain/entities/cart.dart';
import 'package:instar/domain/repositories/cart_repository.dart';

import '../../../core/errors/failures/failures.dart';

class UpdateCartUsecase {
  final CartRepository _repository;

   UpdateCartUsecase(this._repository);

  Future<Either<Failure, Unit>> call( {required Cart cart}) async =>
      await _repository.updateCart(cart:cart);
}
