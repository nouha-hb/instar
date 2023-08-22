import 'package:dartz/dartz.dart';
import 'package:instar/domain/repositories/promotion_repository.dart';

import '../../../core/errors/failures/failures.dart';
import '../../entities/Promotion.dart';

class GetAllPromotionsUsecase {
  final PromotionRepository _repository;

  const GetAllPromotionsUsecase(this._repository);

  Future<Either<Failure, List<Promotion>>> call() async =>
      await _repository.getAllPromotions();
}
