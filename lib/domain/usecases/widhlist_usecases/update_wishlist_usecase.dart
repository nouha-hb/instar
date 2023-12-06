import 'package:dartz/dartz.dart';
import 'package:instar/domain/repositories/wishlist_repository.dart';

import '../../../core/errors/failures/failures.dart';
import '../../entities/wishlist.dart';

class UpdateWishListUsecase {
  final WishListRepository _repository;

   UpdateWishListUsecase(this._repository);

  Future<Either<Failure, Unit>> call( {required WishList wishlist}) async =>
      await _repository.updateWishlist(wishlist:wishlist);
}
