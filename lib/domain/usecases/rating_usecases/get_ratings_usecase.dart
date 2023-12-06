import 'package:dartz/dartz.dart';
import 'package:instar/core/errors/failures/failures.dart';
import 'package:instar/domain/entities/rating.dart';
import 'package:instar/domain/repositories/rating_repository.dart';

class GetRatingsUsecase {
  final RatingRepository _repository;

  GetRatingsUsecase(this._repository);

  Future<Either<Failure, List<Rating>>> call(String productID) async=>await _repository.getRatings(productID);
}
