import 'package:dartz/dartz.dart';
import 'package:instar/core/errors/failures/failures.dart';
import 'package:instar/data/data_Sources/remote_data_source/sales_remote_data_source.dart';
import 'package:instar/data/models/sales_model.dart';
import 'package:instar/domain/entities/sales.dart';
import 'package:instar/domain/repositories/sales_repository.dart';

import '../../core/errors/exceptions/exceptions.dart';

class SalesRepositoryImpl implements SalesRepository{
    final SalesRemoteDataSource salesRemoteDataSource;

  SalesRepositoryImpl(this.salesRemoteDataSource);

  @override
  Future<Either<Failure, Sales>> addSale(Sales newSale) async{
     try {
      final SalesModel sale = SalesModel( productId: newSale.productId, providerId: newSale.providerId, userId: newSale.userId, quantity: newSale.quantity, status: newSale.status, totalPrice: newSale.totalPrice);
      final res = await salesRemoteDataSource.addSale(sale);
      final s =Sales(productId: res.productId, providerId: res.providerId, userId: res.userId, quantity: res.quantity, status: res.status, totalPrice: res.totalPrice , id: res.id);
      return Right(s);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<Sales>>> getAllSales() async{
          try {
      final salesModels = await salesRemoteDataSource.getAllSales();
      final sales = salesModels
          .map((e) =>Sales(id:e.id, productId: e.productId, providerId: e.providerId, userId: e.userId, quantity: e.quantity, status: e.status, totalPrice: e.totalPrice))
          .toList();
      return right(sales);
    } on ServerException {
      return left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Sales>> getSingleSale(String saleId) async{
           try {
      final salesModels = await salesRemoteDataSource.getSingleSales(saleId);
      final Sales sale= Sales(id:salesModels.id ,productId: salesModels.productId, providerId: salesModels.providerId, userId: salesModels.userId, quantity: salesModels.quantity, status: salesModels.status, totalPrice: salesModels.totalPrice) ;
      return right(sale);
    } on ServerException {
      return left(ServerFailure());
    }
  }
  
  @override
  Future<Either<Failure, Unit>> deleteSale(String saleId) async{
              try {
      await salesRemoteDataSource.deleteSales(saleId);
      return right(unit);
    } on ServerException {
      return left(ServerFailure());
    }
  }
}