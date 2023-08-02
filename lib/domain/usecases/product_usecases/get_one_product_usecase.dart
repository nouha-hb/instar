import 'package:dartz/dartz.dart';
import 'package:instar/domain/repositories/product_repository.dart';

import '../../../core/errors/failures/failures.dart';
import '../../entities/product.dart';

class GetOneProductsUsecase {
  final ProductRepository repository;

  GetOneProductsUsecase(this.repository);

  Future<Either<Failure, Product>> call(String productId,List<Product> list) async =>
      await repository.getOneProduct(productId,list);
}
