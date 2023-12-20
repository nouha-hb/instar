import 'package:dartz/dartz.dart';
import 'package:instar/core/errors/failures/failures.dart';
import 'package:instar/domain/entities/Product3D.dart';
import 'package:instar/domain/repositories/product3d_repository.dart';

class Get3DProductsByIdUseCase {
  final Product3DRepository _repository;

  const Get3DProductsByIdUseCase(this._repository);

  Future<Either<Failure, Product3D>> call(String productid) async =>
      await _repository.getOne3DProduct(productid);
}
