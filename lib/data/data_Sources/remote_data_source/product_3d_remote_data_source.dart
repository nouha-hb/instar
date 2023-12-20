import 'package:dio/dio.dart';
import 'package:instar/core/constant/api_const.dart';
import 'package:instar/core/errors/exceptions/exceptions.dart';
import 'package:instar/data/models/product3D_model.dart';

abstract class Product3DRemoteDataSource{
  Future<List<Product3DModel>> getAll3DProducts(String product);
  Future<Product3DModel> getone3DProducts(String productId);
}

class Product3DRemoteDataSourceImpl implements Product3DRemoteDataSource{
    Dio dio = Dio();

  @override
  Future<List<Product3DModel>> getAll3DProducts(String product)async {
       try {
      final response = await dio.get("${ApiConst.allproduct3D}/$product");
      List<dynamic> data = response.data;
      List<Product3DModel> products3d =
          data.map((e) => Product3DModel.fromJson(e)).toList();
      return products3d;
    } catch (e) {
      print(e);
      throw ServerException();
    }
  }

  @override
  Future<Product3DModel> getone3DProducts(String productId) async{
      try {
      final response = await dio.get("${ApiConst.product3D}/$productId");
     final data = response.data;
      Product3DModel product3d =Product3DModel.fromJson(data);
      return product3d;
    } catch (e) {
      print(e);
      throw ServerException();
    }
  }

}