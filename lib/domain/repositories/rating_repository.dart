import 'package:dartz/dartz.dart';
import 'package:instar/core/errors/failures/failures.dart';
import 'package:instar/domain/entities/rating.dart';

abstract class RatingRepository {
  Future<Either<Failure, Rating>> addRating(Rating rating);
  Future<Either<Failure, List<Rating>>> getRatings(String productID);
  Future<Either<Failure, Rating>> getSingleRating(String ratingID);
  Future<Either<Failure, Rating>> updateRating(Rating newRating);
  Future<Either<Failure, Unit>> deleteRating(String ratingID);
  Future<Either<Failure, double>> getRatingAverage(String productID);
}
