import 'package:dartz/dartz.dart';
import 'package:instar/core/errors/exceptions/exceptions.dart';

import 'package:instar/core/errors/failures/failures.dart';
import 'package:instar/domain/entities/paiement.dart';



import '../../domain/repositories/paiement_repository.dart';
import '../data_Sources/remote_data_source/paiement_remote_data_source.dart';

class PaiementRepositoryImpl implements PaiementRepository {
  final PaiementRemoteDataSource paiementremoteDataSource;


  const PaiementRepositoryImpl(Object object, 
      {required this.paiementremoteDataSource});



  
  @override
  Future<Either<Failure, Unit>> paiementMethod(Paiement paiement)
   async {
    // TODO: implement paiement
      try {
      await paiementremoteDataSource.PaiementMethod(paiement);
      return const Right(unit);
    } on RegistrationException {
      return Left(RegistrationFailure());
    }
  }

 
}
