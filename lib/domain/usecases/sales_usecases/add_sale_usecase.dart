import 'package:dartz/dartz.dart';
import 'package:instar/domain/repositories/sales_repository.dart';

import '../../../core/errors/failures/failures.dart';
import '../../entities/sales.dart';

class AddSaleUsecase{
  final SalesRepository repository;

  AddSaleUsecase(this.repository);

  Future<Either<Failure,Unit>> call(Sales newSale)async=>await repository.addSale(newSale);
}