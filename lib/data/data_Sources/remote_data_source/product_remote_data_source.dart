
import 'package:dio/dio.dart';
import 'package:instar/core/errors/exceptions/exceptions.dart';
import 'package:instar/data/data_Sources/local_data_source/authentication_local_data_source.dart';
import 'package:instar/data/models/product_model.dart';
import '../../../core/constant/api_const.dart';

abstract class ProductRemoteDataSource {
  Future<List<ProductModel>> getAllProducts();
  Future<ProductModel> getOneProducts({required String id});
  Future<List<ProductModel>> getProductsByCategory({required String category});
  Future<List<ProductModel>> getProductsBySubCategory({required String category,required subCategory});

}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  Dio dio = Dio();

  Future<String> get token async {
    final _tk = await AuthenticationLocalDataSourceImpl().getUserInformations();
    return _tk.token;
  }

  @override
  Future<List<ProductModel>> getAllProducts() async {
    try {
      final response = await dio.get(
        ApiConst.products,
        options: Options(
          headers: {
            "authorization": "Bearer ${await token}",
          },
        ),
      );
      List<dynamic> data = response.data;
      List<ProductModel> products =
          data.map((e) => ProductModel.fromJson(e)).toList();
      return products;
    } on DioException catch (e) {
      if (e.response!.statusCode == 401) {
        throw NotAuthorizedException();
      } else {
        throw ServerException();
      }
    }
  }

  @override
  Future<ProductModel> getOneProducts({required String id}) async {
    ProductModel prod;

    try {
      final response = await dio.get("${ApiConst.products}/$id",
      options: Options(
          headers: {
            "authorization": "Bearer ${await token}",
          },
        ),);
      final data = response.data;
      prod = ProductModel.fromJson(data);
      return prod;
    }on DioException catch (e) {
      if (e.response!.statusCode == 401) {
        throw NotAuthorizedException();
      } else {
        throw ServerException();
      }
    }
  }

  @override
  Future<List<ProductModel>> getProductsByCategory(
      {required String category}) async {
    try {
      final response = await dio.get(
        "${ApiConst.category}/$category",
        options: Options(
          headers: {
            "authorization": "Bearer ${await token}",
          },
        ),
      );

      List<dynamic> _data = response.data;
      List<ProductModel> products =
          _data.map((e) => ProductModel.fromJson(e)).toList();
      print(products);
      return products;
    } on DioException catch (e) {
      if (e.response!.statusCode == 401) {
        throw NotAuthorizedException();
      } else {
        throw ServerException();
      }
    }
  }
  
  @override
  Future<List<ProductModel>> getProductsBySubCategory({required String category, required subCategory}) async{
     try {
      final response = await dio.get(
        "${ApiConst.category}/$category/subcategory/$subCategory",
        options: Options(
          headers: {
            "authorization": "Bearer ${await token}",
          },
        ),
      );

      List<dynamic> _data = response.data;
      List<ProductModel> products =
          _data.map((e) => ProductModel.fromJson(e)).toList();
      print(products);
      return products;
    } on DioException catch (e) {
      if (e.response!.statusCode == 401) {
        throw NotAuthorizedException();
      } else {
        throw ServerException();
      }
    }
  }


}
