import 'package:dartz/dartz.dart';
import 'package:instar/core/errors/failures/failures.dart';
import 'package:instar/domain/entities/reclamation.dart';
import 'package:instar/domain/repositories/reclamation_repository.dart';

class GetAllReclamationsUsecase {
  final ReclamationRepository _repository;

 const GetAllReclamationsUsecase(this._repository);

  Future<Either<Failure, List<Reclamation>>> call(String userID) async =>
      await _repository.getAllReclamations(userID);
}
