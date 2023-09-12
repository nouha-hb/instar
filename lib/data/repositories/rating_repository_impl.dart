import 'package:dartz/dartz.dart';
import 'package:instar/core/errors/exceptions/exceptions.dart';
import 'package:instar/core/errors/failures/failures.dart';
import 'package:instar/data/data_Sources/remote_data_source/rating_remote_data_source.dart';
import 'package:instar/data/models/rating_model.dart';
import 'package:instar/domain/entities/rating.dart';
import 'package:instar/domain/repositories/rating_repository.dart';

class RatingRepositoryImpl implements RatingRepository {
  final RatingRemoteDataSource ratingRemoteDataSource;

  RatingRepositoryImpl(this.ratingRemoteDataSource);

  @override
  Future<Either<Failure, Unit>> addRating(Rating rating) async {
    try {
      final RatingModel rm = RatingModel(
          id: rating.id,
          userId: rating.userId,
          productId: rating.productId,
          rating: rating.rating);
      await ratingRemoteDataSource.addRating(rm);
      return right(unit);
    } on ServerException {
      return left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteRating(String ratingID) async {
    try {
      await ratingRemoteDataSource.deleteRating(ratingID);
      return right(unit);
    } on ServerException {
      return left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<Rating>>> getRatings(String productID) async {
    try {
      final ratingModels = await ratingRemoteDataSource.getRatings(productID);
      final ratings = ratingModels
          .map((e) => Rating(
              id: e.id,
              userId: e.userId,
              productId: e.productId,
              rating: e.rating))
          .toList();
      return right(ratings);
    } on ServerException {
      return left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Rating>> getSingleRating(String ratingID) async {
    try {
      final ratingModel =
          await ratingRemoteDataSource.getSingleRating(ratingID);
      final rating = Rating(
          id: ratingModel.id,
          userId: ratingModel.userId,
          productId: ratingModel.productId,
          rating: ratingModel.rating);
      return right(rating);
    } on ServerException {
      return left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Rating>> updateRating(Rating newRating) async {
    try {
      final RatingModel newRM = RatingModel(
          id: newRating.id,
          userId: newRating.userId,
          productId: newRating.productId,
          rating: newRating.rating);

      final ratingModel = await ratingRemoteDataSource.updateRating(newRM);
      final rating = Rating(
          id: ratingModel.id,
          userId: ratingModel.userId,
          productId: ratingModel.productId,
          rating: ratingModel.rating);
      return right(rating);
    } on ServerException {
      return left(ServerFailure());
    }
  }
}
