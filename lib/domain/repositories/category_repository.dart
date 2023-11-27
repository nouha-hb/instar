

import 'package:dartz/dartz.dart';
import 'package:instar/core/errors/failures/failures.dart';

import '../entities/category.dart';

abstract class CategoryRepository {
  Future<Either<Failure, List<Category>>> getAllCategories();
}
