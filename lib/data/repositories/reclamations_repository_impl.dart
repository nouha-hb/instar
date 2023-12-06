import 'package:dartz/dartz.dart';
import 'package:instar/core/errors/failures/failures.dart';
import 'package:instar/data/data_Sources/remote_data_source/reclamations_remote_data_source.dart';
import 'package:instar/data/models/reclamation_model.dart';
import 'package:instar/domain/entities/reclamation.dart';
import 'package:instar/domain/repositories/reclamation_repository.dart';

import '../../core/errors/exceptions/exceptions.dart';

class ReclamationsRepositoryImpl implements ReclamationRepository{
    final ReclamtionsRemoteDataSource reclamationRemoteDataSource;

  ReclamationsRepositoryImpl(this.reclamationRemoteDataSource);

  @override
  Future<Either<Failure, Unit>> addReclamation(Reclamation newReclamation) async{
       try {
      final ReclamationModel reclamation = ReclamationModel(date: newReclamation.date, user: newReclamation.user, sales: newReclamation.sales, reference: newReclamation.reference, price: newReclamation.price, status: newReclamation.status); 
      await reclamationRemoteDataSource.addNewReclamations(reclamation);
      return const Right(unit);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<Reclamation>>> getAllReclamations(String userID) async{
        try {
      final ReclamationModels = await reclamationRemoteDataSource.getAllReclamations(userID);
      final reclamations = ReclamationModels
          .map((e) =>Reclamation(id:e.id,date: e.date, user: e.user, sales: e.sales, reference: e.reference, price: e.price, status: e.status))
          .toList();
      return right(reclamations);
    } on ServerException {
      return left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Reclamation>> getSingleReclamation(String reclamationID) async{
              try {
      final salesModels = await reclamationRemoteDataSource.getSingleReclamations(reclamationID);
      final Reclamation reclamation = Reclamation(id:salesModels.id,date: salesModels.date, user: salesModels.user, sales: salesModels.sales, reference: salesModels.reference, price: salesModels.price, status: salesModels.status);
      return right(reclamation);
    } on ServerException {
      return left(ServerFailure());
    }
  }

}