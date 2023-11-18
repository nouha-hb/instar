import 'package:dartz/dartz.dart';
import 'package:instar/core/errors/failures/failures.dart';
import 'package:instar/domain/entities/fournisseur.dart';

abstract class FournisseurRepository {
  Future<Either<Failure, List<Fournisseur>>> getAllFournisseurs();
  Future<Either<Failure, Fournisseur>> getFournisseurById(String fournisseurId);
}
