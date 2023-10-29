

import 'package:dartz/dartz.dart';
import 'package:instar/core/errors/failures/failures.dart';

import '../entities/subCategory.dart';


abstract class SubCategoryRepository {
  Future<Either<Failure, List<SubCategory>>> getAllSubCategories();
}
