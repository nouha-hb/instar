import 'package:dio/dio.dart';
import 'package:instar/core/errors/exceptions/exceptions.dart';
import 'package:instar/data/data_Sources/local_data_source/authentication_local_data_source.dart';
import 'package:instar/data/models/fournisseur_model.dart';
import '../../../core/constant/api_const.dart';

abstract class FournisseurRemoteDataSource {
  Future<List<FournisseurModel>> getAllFournisseurs();
  Future<FournisseurModel> getFournisseurById({required String id});
  // Future<List<FournisseurModel>> updateFournisseur({required FournisseurModel fournisseur});
}

class FournisseurRemoteDataSourceImpl implements FournisseurRemoteDataSource {
  Dio dio = Dio();

  Future<String> get token async {
    final tk = await AuthenticationLocalDataSourceImpl().getUserInformations();
    return tk.token;
  }

  @override
  Future<List<FournisseurModel>> getAllFournisseurs() async {
    try {
      final response = await dio.get(
        ApiConst.fournisseur,
        options: Options(
          headers: {
            "authorization": "Bearer ${await token}",
          },
        ),
      );
      List<dynamic> data = response.data;
      List<FournisseurModel> fournisseurs =
          data.map((e) => FournisseurModel.fromJson(e)).toList();
      return fournisseurs;
    } on DioException catch (e) {
      if (e.response!.statusCode == 401) {
        throw NotAuthorizedException();
      } else {
        throw ServerException();
      }
    }
  }

  @override
  Future<FournisseurModel> getFournisseurById({required String id}) async {
    FournisseurModel fournisseur;

    try {
      final response = await dio.get(
        "${ApiConst.fournisseur}/$id",
        // options: Options(
        //   headers: {
        //     "authorization": "Bearer ${await token}",
        //   },
        // ),
      );
      final data = response.data;
      fournisseur = FournisseurModel.fromJson(data);
      print('fourniseur loaded: $fournisseur');
      return fournisseur;
    } on DioException catch (e) {
      if (e.response!.statusCode == 401) {
        throw NotAuthorizedException();
      } else {
        throw ServerException();
      }
    }
  }
}
