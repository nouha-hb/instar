import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:instar/core/errors/exceptions/exceptions.dart';
import 'package:instar/data/data_Sources/local_data_source/authentication_local_data_source.dart';
import 'package:instar/data/models/product_model.dart';
import 'package:instar/domain/entities/token.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/constant/api_const.dart';

abstract class ProductRemoteDataSource {
  Future<List<ProductModel>> getAllProducts();
  Future<ProductModel> getOneProducts({required String id});
  Future<List<ProductModel>> getProductsByCategory({required String category});
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  Dio dio = Dio();
  @override
  Future<List<ProductModel>> getAllProducts() async {
    try {
      final _sp = await SharedPreferences.getInstance();
      final tk =
          await AuthenticationLocalDataSourceImpl().getUserInformations();
      final response = await dio.get(
        ApiConst.products,
        options: Options(
          headers: {
            "authorization": "Bearer ${tk.token}",
          },
        ),
      );

      List<dynamic> data = response.data;
      print(data);
      List<ProductModel> products =
          data.map((e) => ProductModel.fromJson(e)).toList();
      print(products);
      return products;
    } catch (e) {
      print(e.toString());
      throw ServerException();
    }
  }

  @override
  Future<ProductModel> getOneProducts({required String id}) async {
    ProductModel prod;

    try {
      final response = await dio.get("${ApiConst.products}/$id");

      final data = response.data;
      prod = ProductModel.fromJson(data);
      return prod;
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<List<ProductModel>> getProductsByCategory({required String category}) async {
    try {
      final _sp = await SharedPreferences.getInstance();
      final tk =
          await AuthenticationLocalDataSourceImpl().getUserInformations();
      final response = await dio.get(
        "${ApiConst.category}/$category",
        options: Options(
          headers: {
            "authorization": "Bearer ${tk.token}",
          },
        ),
      );

      List<dynamic> _data = response.data;
     // print(_data);
      List<ProductModel> products =
          _data.map((e) => ProductModel.fromJson(e)).toList();
      print(products);
      return products;
    } catch (e) {
      print(e.toString());
      throw ServerException();
    }
  }
}
