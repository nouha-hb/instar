import 'package:dartz/dartz.dart';
import 'package:instar/domain/entities/paiement.dart';
import '../../../../core/errors/failures/failures.dart';

import '../../repositories/paiement_repository.dart';


class PaiementUsecase {
  final PaiementRepository repository;

  const PaiementUsecase(this.repository);
  Future<Either<Failure, Unit>> call(Paiement paiement) async => 
  
  await repository.paiementMethod(paiement);
}
