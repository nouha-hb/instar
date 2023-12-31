import 'package:dartz/dartz.dart';
import 'package:instar/core/errors/exceptions/exceptions.dart';
import 'package:instar/core/errors/failures/failures.dart';
import 'package:instar/data/data_Sources/remote_data_source/product_remote_data_source.dart';
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
              id: e.id,
              reference: e.reference,
              dimensions:e.dimensions,
              provider: e.provider,
              category: e.category,
              name: e.name,
              description: e.description,
              price: e.price,
              quantity: e.quantity,
              subCategory: e.subCategory,
              image: e.image,
              ))
          .toList();
      return right(products);
    } on ServerException {
      return left(ServerFailure());
    } on NotAuthorizedException {
      return left(NotAuthorizedFailure());
    }
  }

  @override
  Future<Either<Failure, Product>> getOneProduct(String productId) async {
    try {
      final product =
          await productRemoteDataSource.getOneProducts(id: productId);
      return right(product);
  } on ServerException {
      return left(ServerFailure());
    } on NotAuthorizedException {
      return left(NotAuthorizedFailure());
    }
  }

  @override
  Future<Either<Failure, List<Product>>> getProductsByCategory(
      String category) async {
    try {
      final productModels = await productRemoteDataSource.getProductsByCategory(
          category: category);
      final products = productModels
          .map((e) => Product(
              id: e.id,
              reference: e.reference,
              dimensions:e.dimensions,
              provider: e.provider,
              category: e.category,
              name: e.name,
              description: e.description,
              price: e.price,
              quantity: e.quantity,
               subCategory: e.subCategory,
              image: e.image))
          .toList();
      return right(products);
  } on ServerException {
      return left(ServerFailure());
    } on NotAuthorizedException {
      return left(NotAuthorizedFailure());
    }
  }

  @override
  Future<Either<Failure, List<Product>>> getProductsBySubCategory(String category,
      String subCategory) async{
     try {
      final productModels = await productRemoteDataSource.getProductsBySubCategory(
          category: category,subCategory: subCategory);
      final products = productModels
          .map((e) => Product(
              id: e.id,
              reference: e.reference,
              dimensions:e.dimensions,
              provider: e.provider,
              category: e.category,
              name: e.name,
              description: e.description,
              price: e.price,
              quantity: e.quantity,
               subCategory: e.subCategory,
              image: e.image,))
          .toList();
      return right(products);
} on ServerException {
      return left(ServerFailure());
    } on NotAuthorizedException {
      return left(NotAuthorizedFailure());
    }
  }
}