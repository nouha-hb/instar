
import 'package:dio/dio.dart';
import 'package:instar/core/errors/exceptions/exceptions.dart';
import 'package:instar/data/data_Sources/local_data_source/authentication_local_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/constant/api_const.dart';
import '../../models/subcategory_model.dart';

abstract class SubCategoryRemoteDataSource {
  Future<List<SubCategoryModel>> getAllSubCategories();
  // Future<List<FournisseurModel>> updateFournisseur({required FournisseurModel fournisseur});
}

class SubCategoryRemoteDataSourceImpl implements SubCategoryRemoteDataSource {
  Dio dio = Dio();

  Future<String> get token async {
    final _sp = await SharedPreferences.getInstance();
    final _tk = await AuthenticationLocalDataSourceImpl().getUserInformations();
    return _tk.token;
  }

  @override
  Future<List<SubCategoryModel>> getAllSubCategories() async {
    try {
      final response = await dio.get(
        ApiConst.getSubCategories,
        options: Options(
          headers: {
            "authorization": "Bearer ${await token}",
          },
        ),
      );
      List<dynamic> data = response.data;
      List<SubCategoryModel> subCategories =
          data.map((e) => SubCategoryModel(name: e)).toList();
      return subCategories;
    } on DioException catch (e) {
      if (e.response!.statusCode == 401) {
        throw NotAuthorizedException();
      } else {
        throw ServerException();
      }
    }
  }
}
