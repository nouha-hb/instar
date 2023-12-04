import 'package:dartz/dartz.dart';
import 'package:instar/core/errors/failures/failures.dart';
import 'package:instar/domain/entities/Product3D.dart';

abstract class Product3DRepository {
  Future<Either<Failure, List<Product3D>>> getAll3DProducts(String product);
  Future<Either<Failure, Product3D>> getOne3DProduct(String product3DId);
}
