import 'package:dartz/dartz.dart';
import 'package:instar/core/errors/failures/failures.dart';
import 'package:instar/domain/entities/rating.dart';
import 'package:instar/domain/repositories/rating_repository.dart';

class GetSingleRatingUsecase {
  final RatingRepository _repository;

  GetSingleRatingUsecase(this._repository);

  Future<Either<Failure, Rating>> call(String ratingID) async => await _repository.getSingleRating(ratingID);
}
