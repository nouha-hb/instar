import 'package:dartz/dartz.dart';
import 'package:instar/core/errors/failures/failures.dart';
import 'package:instar/domain/repositories/rating_repository.dart';

class GetRatingAverageUsecase {
  final RatingRepository _repository;

 const GetRatingAverageUsecase(this._repository);

  Future<Either<Failure, double>> call(String productID) async =>
      await _repository.getRatingAverage(productID);
}
