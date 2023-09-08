import 'package:dartz/dartz.dart';
import 'package:instar/domain/repositories/product_repository.dart';

import '../../../core/errors/failures/failures.dart';
import '../../entities/product.dart';

class GetProductsBySubCategoryUsecase {
  final ProductRepository repository;

  GetProductsBySubCategoryUsecase(this.repository);

  Future<Either<Failure,  List<Product>>> call(String category,String subCategory) async =>
      await repository.getProductsBySubCategory(category,subCategory);
}
