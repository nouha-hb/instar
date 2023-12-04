import 'package:dartz/dartz.dart';
import 'package:instar/core/errors/failures/failures.dart';
import 'package:instar/domain/entities/Product3D.dart';
import 'package:instar/domain/repositories/product3d_repository.dart';

class GetAll3DProductsUseCase {
  final Product3DRepository _repository;

  const GetAll3DProductsUseCase(this._repository);

  Future<Either<Failure, List<Product3D>>> call(String product) async =>
      await _repository.getAll3DProducts(product);
}
