import 'package:dartz/dartz.dart';
import 'package:instar/domain/repositories/review_repository.dart';

import '../../../core/errors/failures/failures.dart';

class RemoveReviewUsecase {
  final ReviewRepository _repository;

  const RemoveReviewUsecase(this._repository);

  Future<Either<Failure, Unit>> call(String prodId) async=>
      await _repository.removeReview(prodId);
}
