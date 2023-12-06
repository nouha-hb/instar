import 'package:dartz/dartz.dart';
import 'package:instar/domain/repositories/sales_repository.dart';

import '../../../core/errors/failures/failures.dart';
import '../../entities/sales.dart';

class GetAllSalesUsecase{
  final SalesRepository repository;

  GetAllSalesUsecase(this.repository);

  Future<Either<Failure,List<Sales>>> call()async=>await repository.getAllSales();
}