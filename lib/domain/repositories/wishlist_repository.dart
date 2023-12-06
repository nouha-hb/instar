import 'package:dartz/dartz.dart';
import 'package:instar/domain/entities/wishlist.dart';

import '../../core/errors/failures/failures.dart';

abstract class WishListRepository {
  Future<Either<Failure, Unit>> createWishlist({required String userId});
  Future<Either<Failure, Unit>> updateWishlist(
      {required WishList wishlist});
  Future<Either<Failure,WishList>> getWishlist({required String userId});
}
