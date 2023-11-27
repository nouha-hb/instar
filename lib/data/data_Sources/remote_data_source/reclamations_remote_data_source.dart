import 'package:dio/dio.dart';
import 'package:instar/data/models/reclamation_model.dart';
import 'package:instar/domain/entities/reclamation.dart';

import '../../../core/constant/api_const.dart';
import '../../../core/errors/exceptions/exceptions.dart';

abstract class ReclamtionsRemoteDataSource{
  Future<List<Reclamation>> getAllReclamations(String userId);
  Future<Reclamation> getSingleReclamations(String reclamationId);
  Future<void> addNewReclamations(ReclamationModel newReclamation);

}

class ReclamationRemoteDataSourceImpl implements ReclamtionsRemoteDataSource{
      Dio dio = Dio();

  @override
  Future<List<Reclamation>> getAllReclamations(String userId) async{
    try {
      final response = await dio.get('${ApiConst.reclamations}/all/$userId');
      List<dynamic> data = response.data;
      List<ReclamationModel> sales =
          data.map((e) => ReclamationModel.fromJson(e)).toList();
      return sales;
    } catch (e) {
      print('command error ${e.toString()}');
      throw ServerException();
    }
  }

  @override
  Future<Reclamation> getSingleReclamations(String reclamationId) async{
     try {
      final response = await dio.get('${ApiConst.reclamations}/$reclamationId');
      final data = response.data;
      return ReclamationModel.fromJson(data);
    } catch (e) {
      throw ServerException();
    }
  }
  
  @override
  Future<void> addNewReclamations(ReclamationModel newReclamation) async{
      try {
      await dio.post(ApiConst.reclamations, data: newReclamation.toJson());
    } catch (e) {
      throw ServerException();
    }
  }
}