import 'package:dartz/dartz.dart';
import 'package:instar/core/errors/failures/failures.dart';
import 'package:instar/domain/entities/sales.dart';

abstract class SalesRepository{
  Future<Either<Failure,List<Sales>>> getAllSales();
  Future<Either<Failure,Sales>> getSingleSale(String saleId);
  Future<Either<Failure,Unit>> addSale(Sales newSale);
}