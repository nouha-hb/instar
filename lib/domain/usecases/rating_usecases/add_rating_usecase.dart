import 'package:dartz/dartz.dart';
import 'package:instar/core/errors/failures/failures.dart';
import 'package:instar/domain/entities/rating.dart';
import 'package:instar/domain/repositories/rating_repository.dart';

class AddRatingUsecase {
  final RatingRepository _repository;

  AddRatingUsecase(this._repository);

  Future<Either<Failure, Rating>> call(Rating rating) async => await _repository.addRating(rating);
}
