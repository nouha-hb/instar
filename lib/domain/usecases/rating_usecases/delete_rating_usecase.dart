import 'package:dartz/dartz.dart';
import 'package:instar/core/errors/failures/failures.dart';
import 'package:instar/domain/entities/rating.dart';
import 'package:instar/domain/repositories/rating_repository.dart';

class DeleteRatingUsecase {
  final RatingRepository _repository;

  DeleteRatingUsecase(this._repository);

  Future<Either<Failure, Unit>> call(String ratingID) async => await _repository.deleteRating(ratingID);
}
