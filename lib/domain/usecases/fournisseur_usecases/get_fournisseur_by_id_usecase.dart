import 'package:dartz/dartz.dart';
import 'package:instar/domain/entities/fournisseur.dart';

import '../../../core/errors/failures/failures.dart';
import '../../repositories/fournisseur_repository.dart';

class GetFournisseursByIdUsecase {
  final FournisseurRepository repository;

 const GetFournisseursByIdUsecase(this.repository);

  Future<Either<Failure, Fournisseur>> call(String id) async =>
      await repository.getFournisseurById(id);
}
