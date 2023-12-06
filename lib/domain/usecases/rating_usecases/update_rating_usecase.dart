import 'package:dartz/dartz.dart';
import 'package:instar/core/errors/failures/failures.dart';
import 'package:instar/domain/entities/rating.dart';
import 'package:instar/domain/repositories/rating_repository.dart';

class UpdateRatingUsecase {
  final RatingRepository _repository;

  UpdateRatingUsecase(this._repository);

  Future<Either<Failure, Rating>> call(Rating newRating) async => await _repository.updateRating(newRating);
}
