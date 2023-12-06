import 'package:dartz/dartz.dart';
import 'package:instar/domain/entities/fournisseur.dart';

import '../../../core/errors/failures/failures.dart';
import '../../repositories/fournisseur_repository.dart';

class GetAllFournisseursUsecase {
  final FournisseurRepository repository;

 const GetAllFournisseursUsecase(this.repository);

  Future<Either<Failure, List<Fournisseur>>> call() async =>
      await repository.getAllFournisseurs();
}
