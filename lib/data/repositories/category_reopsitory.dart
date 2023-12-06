import 'package:dartz/dartz.dart';
import 'package:instar/core/errors/exceptions/exceptions.dart';
import 'package:instar/core/errors/failures/failures.dart';
import 'package:instar/domain/entities/category.dart';

import '../../domain/repositories/category_repository.dart';
import '../data_sources/remote_data_source/category_remote_data_source.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryRemoteDataSource categoryRemoteDataSource;

  const CategoryRepositoryImpl(this.categoryRemoteDataSource);

  @override
  Future<Either<Failure, List<Category>>> getAllCategories() async {
    try {
      final categoryModels = await categoryRemoteDataSource.getAllCategories();
      final category = categoryModels
          .map((e) => Category(
       
               name: e.name,
             
              
              ))
          .toList();
      return right(category);
    } on ServerException {
      return left(ServerFailure());
    } on NotAuthorizedException {
      return left(NotAuthorizedFailure());
    }
  }

  
 

  
}
