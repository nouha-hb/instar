import 'package:dartz/dartz.dart';
import 'package:instar/core/errors/exceptions/exceptions.dart';
import 'package:instar/core/errors/failures/failures.dart';
import 'package:instar/data/data_Sources/remote_data_source/product_remote_data_source.dart';
import 'package:instar/data/models/product_model.dart';
import 'package:instar/domain/entities/product.dart';
import 'package:instar/domain/repositories/product_repository.dart';

class ProductRepositoryImp implements ProductRepository {
  final ProductRemoteDataSource productRemoteDataSource;

  const ProductRepositoryImp(this.productRemoteDataSource);

  @override
  Future<Either<Failure, List<Product>>> getAllProducts() async {
    try {
      final productModels = await productRemoteDataSource.getAllProducts();
      final products = productModels
          .map((e) => Product(
              name: e.name,
              description: e.description,
              price: e.price,
              quantity: e.quantity))
          .toList();
      return right(products);
    } on ServerException {
      return left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Product>> getOneProduct(String productId,List<Product> list) async{
   try {
    final products = list
          .map((e) => ProductModel(
              name: e.name,
              description: e.description,
              price: e.price,
              quantity: e.quantity))
          .toList();
      final product = await productRemoteDataSource.getOneProducts(id: productId,list: products);
      return right(product);
    } on ProductNotFoundException {
      return left(ProductNotFoundFailure());
    }
  }

  @override
  Future<Either<Failure, List<Product>>> getProductsByCategory(
      String category) {
    // TODO: implement getProductsByCategory
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Product>>> getProductsBySubCategory(
      String subCategory) {
    // TODO: implement getProductsBySubCategory
    throw UnimplementedError();
  }
}
