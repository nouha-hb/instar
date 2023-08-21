import 'package:dartz/dartz.dart';
import 'package:instar/core/errors/failures/failures.dart';
import 'package:instar/data/data_Sources/remote_data_source/wishlist_remote_data_source.dart';
import 'package:instar/data/models/wishlist_model.dart';
import 'package:instar/domain/entities/wishlist.dart';
import 'package:instar/domain/repositories/wishlist_repository.dart';

import '../../core/errors/exceptions/exceptions.dart';

class WishListRepositoryImpl implements WishListRepository {
  final WishlistRemoteDataSource wishlistRemoteDataSource;
  WishListRepositoryImpl(this.wishlistRemoteDataSource);

  @override
  Future<Either<Failure, Unit>> createWishlist({required String userId}) async {
    try {
      await wishlistRemoteDataSource.createWishlist(userId: userId);
      return right(unit);
    } on ServerException {
      return left(ServerFailure());
    } on NotAuthorizedException {
      return left(NotAuthorizedFailure());
    }
  }

  @override
  Future<Either<Failure, WishList>> getWishlist(
      {required String userId}) async {
    try {
      final result = await wishlistRemoteDataSource.getWishlist(userId: userId);
      final wishList = WishList(
          id: result.id, userId: result.userId, productsId: result.productsId);
      return right(wishList);
    } on ServerException {
      return left(ServerFailure());
    } on NotAuthorizedException {
      return left(NotAuthorizedFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> updateWishlist(
      {required WishList wishlist}) async {
    try {
      WishListModel wModel = WishListModel(
          id: wishlist.id,
          userId: wishlist.userId,
          productsId: wishlist.productsId);
      await wishlistRemoteDataSource.updateWishlist(wishlist: wModel);
      return right(unit);
    } on ServerException {
      return left(ServerFailure());
    } on NotAuthorizedException {
      return left(NotAuthorizedFailure());
    }
  }
}
