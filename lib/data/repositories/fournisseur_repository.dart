import 'package:dartz/dartz.dart';
import 'package:instar/core/errors/exceptions/exceptions.dart';
import 'package:instar/core/errors/failures/failures.dart';
import '../../domain/entities/fournisseur.dart';
import '../../domain/repositories/fournisseur_repository.dart';
import '../data_sources/remote_data_source/fournisseur_remote_data_source.dart';

class FournisseurRepositoryImpl implements FournisseurRepository {
  final FournisseurRemoteDataSource fournisseurRemoteDataSource;

  const FournisseurRepositoryImpl(this.fournisseurRemoteDataSource);

  @override
  Future<Either<Failure, List<Fournisseur>>> getAllFournisseurs() async {
    try {
      final fournisseurModels = await fournisseurRemoteDataSource.getAllFournisseurs();
      final fournisseurs = fournisseurModels
          .map((e) => Fournisseur(
       
              name: e.name,
              address: e.address,
              phone: e.phone,

              
              ))
          .toList();
      return right(fournisseurs);
    } on ServerException {
      return left(ServerFailure());
    } on NotAuthorizedException {
      return left(NotAuthorizedFailure());
    }
  }

  @override
  Future<Either<Failure, Fournisseur>> getFournisseurById(String fournisseurId) async {
    try {
      final fournisseur =
          await fournisseurRemoteDataSource.getFournisseurById(id: fournisseurId);
      return right(fournisseur);
  } on ServerException {
      return left(ServerFailure());
    } on NotAuthorizedException {
      return left(NotAuthorizedFailure());
    }
  }

  
}
