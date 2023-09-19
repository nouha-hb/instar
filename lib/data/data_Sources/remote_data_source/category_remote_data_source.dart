import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:instar/core/errors/exceptions/exceptions.dart';
import 'package:instar/data/data_Sources/local_data_source/authentication_local_data_source.dart';
import 'package:instar/data/models/category_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/constant/api_const.dart';

abstract class CategoryRemoteDataSource {
  Future<List<CategoryModel>> getAllCategories();
  // Future<List<FournisseurModel>> updateFournisseur({required FournisseurModel fournisseur});
}

class CategoryRemoteDataSourceImpl implements CategoryRemoteDataSource {
  Dio dio = Dio();

  Future<String> get token async {
    final _sp = await SharedPreferences.getInstance();
    final _tk = await AuthenticationLocalDataSourceImpl().getUserInformations();
    return _tk.token;
  }

  @override
  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final response = await dio.get(
        ApiConst.getCategories,
        options: Options(
          headers: {
            "authorization": "Bearer ${await token}",
          },
        ),
      );
      List<dynamic> data = response.data;
      List<CategoryModel> Categories =
          data.map((e) => CategoryModel(name:e)).toList();
      return Categories;
    } on DioException catch (e) {
      if (e.response!.statusCode == 401) {
        throw NotAuthorizedException();
      } else {
        throw ServerException();
      }
    }
  }
}
