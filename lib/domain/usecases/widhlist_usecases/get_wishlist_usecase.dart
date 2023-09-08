import 'package:dartz/dartz.dart';
import 'package:instar/domain/entities/wishlist.dart';
import 'package:instar/domain/repositories/wishlist_repository.dart';

import '../../../core/errors/failures/failures.dart';

class GetWishListUsecase {
  final WishListRepository _repository;

   GetWishListUsecase(this._repository);

  Future<Either<Failure, WishList>> call({required String userId}) async =>
      await _repository.getWishlist(userId:userId);
}
