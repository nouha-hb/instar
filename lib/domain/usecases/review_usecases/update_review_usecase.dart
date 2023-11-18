import 'package:dartz/dartz.dart';
import 'package:instar/domain/repositories/review_repository.dart';

import '../../../core/errors/failures/failures.dart';
import '../../entities/review.dart';

class UpdateReviewUsecase {
  final ReviewRepository _repository;

  const UpdateReviewUsecase(this._repository);

  Future<Either<Failure, Unit>> call(Review review) async=>
      await _repository.updateReview(review);
}
