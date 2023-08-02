import 'dart:convert';

import 'package:instar/core/errors/exceptions/exceptions.dart';
import 'package:instar/data/models/product_model.dart';

import '../../../core/constant/api_const.dart';

abstract class ProductRemoteDataSource {
  Future<List<ProductModel>> getAllProducts();
  Future<ProductModel> getOneProducts(
      {required String id, required List<ProductModel> list});
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  get dio => null;

  @override
  Future<List<ProductModel>> getAllProducts() async {
    try {
      final response = await dio.get(ApiConst.register);

      List<dynamic> data = json.decode(response);
      List<ProductModel> products =
          data.map((e) => ProductModel.fromJson(e)).toList();
      return products;
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<ProductModel> getOneProducts(
      {required String id, required List<ProductModel> list}) async {
    ProductModel prod;
    try {
      if (list.isEmpty) {
        list = await getAllProducts();
      }
      prod = list.firstWhere((element) => element.name == id);
      return Future.value(prod);
    } catch (e) {
      throw ProductNotFoundException();
    }
  }
}
