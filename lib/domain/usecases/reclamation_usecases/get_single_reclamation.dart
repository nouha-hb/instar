import 'package:dartz/dartz.dart';
import 'package:instar/core/errors/failures/failures.dart';
import 'package:instar/domain/entities/reclamation.dart';
import 'package:instar/domain/repositories/reclamation_repository.dart';

class GetSingleReclamationUsecase {
  final ReclamationRepository _repository;

  const GetSingleReclamationUsecase(this._repository);

  Future<Either<Failure,Reclamation>> call(String reclamationID) async =>
      await _repository.getSingleReclamation(reclamationID);
}
