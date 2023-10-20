import 'package:dartz/dartz.dart';
import 'package:instar/domain/entities/paiement.dart';
import '../../core/errors/failures/failures.dart';

abstract class PaiementRepository {
  Future<Either<Failure,Unit>> paiementMethod(Paiement paiement);

}
