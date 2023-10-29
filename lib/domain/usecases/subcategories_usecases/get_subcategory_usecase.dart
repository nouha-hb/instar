import 'package:dartz/dartz.dart';

import '../../../core/errors/failures/failures.dart';
import '../../entities/subCategory.dart';
import '../../repositories/subcategory_repository.dart';

class GetAllSubCategoriesUsecase {
  final SubCategoryRepository repository;

  GetAllSubCategoriesUsecase(this.repository);

  Future<Either<Failure, List<SubCategory>>> call() async =>
      await repository.getAllSubCategories();
}
