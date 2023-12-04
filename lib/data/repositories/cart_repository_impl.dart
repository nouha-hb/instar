import 'package:dartz/dartz.dart';
import 'package:instar/core/errors/failures/failures.dart';
import 'package:instar/data/data_Sources/remote_data_source/cart_remote_data_source.dart';
import 'package:instar/data/models/cart_model.dart';
import 'package:instar/domain/entities/cart.dart';
import 'package:instar/domain/repositories/cart_repository.dart';

import '../../core/errors/exceptions/exceptions.dart';

class CartRepositoryImpl implements CartRepository {
    final CartRemoteDataSource cartRemoteDataSource;

  CartRepositoryImpl(this.cartRemoteDataSource);


  @override
  Future<Either<Failure, Unit>> createCart({required String userId}) async{
    try {
      await cartRemoteDataSource.createCart(userId: userId);
      return right(unit);
    } on ServerException {
      return left(ServerFailure());
    } on NotAuthorizedException {
      return left(NotAuthorizedFailure());
    }
  }

  @override
  Future<Either<Failure, Cart>> getCart({required String userId}) async{
  try {
      final result = await cartRemoteDataSource.getCart(userId: userId);
      final cart = Cart(
          id: result.id, userId: result.userId, sales: result.sales);
      return right(cart);
    } on ServerException {
      return left(ServerFailure());
    } on NotAuthorizedException {
      return left(NotAuthorizedFailure());
    }
  }

  @override
  Future<Either<Failure, Cart>> updateCart({required Cart cart}) async{
   try {
      CartModel cModel = CartModel(
          id: cart.id,
          userId: cart.userId,
          sales: cart.sales);
     final result = await cartRemoteDataSource.updateCart(cart: cModel);
      final crt = Cart(
          id: result.id, userId: result.userId, sales: result.sales);
      return right(crt);
    } on ServerException {
      return left(ServerFailure());
    } on NotAuthorizedException {
      return left(NotAuthorizedFailure());
    }
  }
}
