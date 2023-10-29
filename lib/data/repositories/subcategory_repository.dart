import 'package:dartz/dartz.dart';
import 'package:instar/core/errors/exceptions/exceptions.dart';
import 'package:instar/core/errors/failures/failures.dart';
import 'package:instar/domain/entities/category.dart';

import '../../domain/entities/subCategory.dart';
import '../../domain/repositories/subcategory_repository.dart';
import '../data_sources/remote_data_source/subcategory_remote_data_source.dart';

class SubCategoryRepositoryImpl implements SubCategoryRepository {
  final SubCategoryRemoteDataSource subcategoryRemoteDataSource;

  const SubCategoryRepositoryImpl(this.subcategoryRemoteDataSource);

  @override
  Future<Either<Failure, List<SubCategory>>> getAllSubCategories() async {
    try {
      final subcategoryModels =
          await subcategoryRemoteDataSource.getAllSubCategories();
      final subcategory = subcategoryModels
          .map((e) => SubCategory(
                name: e.name,
              ))
          .toList();
      return right(subcategory);
    } on ServerException {
      return left(ServerFailure());
    } on NotAuthorizedException {
      return left(NotAuthorizedFailure());
    }
  }
}
