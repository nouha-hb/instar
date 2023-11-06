
import 'package:instar/core/constant/api_const.dart';
import 'package:instar/data/models/paiement_model.dart';

import 'package:dio/dio.dart';

import '../../../core/errors/exceptions/exceptions.dart';
import '../../../domain/entities/paiement.dart';



abstract class PaiementRemoteDataSource {
  Future<void> PaiementMethod(Paiement paiement);
 
}

class PaiementRemoteDataSourceImpl
    implements PaiementRemoteDataSource {
  final dio = Dio();


  
  @override
  Future<void> PaiementMethod(Paiement paiement) async{
    try {
      PaiementModel paiementModel = PaiementModel(
          Nom: paiement.Nom,
          Code: paiement.Code,
          DateExp: paiement.DateExp,
          CVV: paiement.CVV,
    


  
          );
      await dio.post(ApiConst.paiement, data: paiementModel.toJson());
    } catch (e) {
      throw RegistrationException();
    }
  }


}
