import 'package:dartz/dartz.dart';

import '../../core/errors/failures/failures.dart';
import '../entities/Promotion.dart';

abstract class PromotionRepository {
  Future<Either<Failure, List<Promotion>>> getAllPromotions();
}
