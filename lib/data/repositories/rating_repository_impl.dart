import 'package:dartz/dartz.dart';
import 'package:instar/core/errors/failures/failures.dart';
import 'package:instar/domain/entities/rating.dart';
import 'package:instar/domain/repositories/rating_repository.dart';

class RatingRepositoryImpl implements RatingRepository{
  @override
  Future<Either<Failure, Unit>> addRating(Rating rating) {
    // TODO: implement addRating
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> deleteRating(String ratingID) {
    // TODO: implement deleteRating
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Rating>>> getRatings(String productID) {
    // TODO: implement getRatings
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Rating>> getSingleRating(String ratingID) {
    // TODO: implement getSingleRating
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Rating>> updateRating(Rating newRating) {
    // TODO: implement updateRating
    throw UnimplementedError();
  }
}