import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/constant/api_const.dart';
import '../../../core/errors/exceptions/exceptions.dart';
import '../../models/cart_model.dart';
import '../local_data_source/authentication_local_data_source.dart';

abstract class CartRemoteDataSource {
  Future<void> createCart({required String userId});
  Future<void> updateCart(
      {required CartModel cart});
  Future<CartModel> getCart({required String userId});
}

class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  Dio dio = Dio();

  Future<String> get token async {
    final _sp = await SharedPreferences.getInstance();
    final _tk = await AuthenticationLocalDataSourceImpl().getUserInformations();
    return _tk.token;
  }
  
  @override
  Future<void> createCart({required String userId}) async{
     try {
       await dio.post(
        ApiConst.cart,
        data: {"userId": userId},
        options: Options(
          headers: {
            "authorization": "Bearer ${await token}",
          },
        ),
      );
    } on DioException catch (e) {
      if (e.response!.statusCode == 401) {
        throw NotAuthorizedException();
      } else {
        throw ServerException();
      }
    }
  }
  
  @override
  Future<CartModel> getCart({required String userId}) async{
    try {
      final response = await dio.get(
        "${ApiConst.getCart}/$userId",
        options: Options(
          headers: {
            "authorization": "Bearer ${await token}",
          },
        ),
      );
      final data = response.data;
      CartModel cart = CartModel.fromJson(data);
      return cart;
    } on DioException catch (e) {
      if (e.response!.statusCode == 401) {
        throw NotAuthorizedException();
      } else {
        throw ServerException();
      }
    }
  }
  
  @override
  Future<void> updateCart({required CartModel cart}) async{
   try {
       await dio.post(
        "${ApiConst.getCart}/${cart.id}",
        data: {"userId": cart.userId,
              "products": cart.productsId.map((e) => {"productId":e})
              },
        options: Options(
          headers: {
            "authorization": "Bearer ${await token}",
          },
        ),
      );
    } on DioException catch (e) {
      if (e.response!.statusCode == 401) {
        throw NotAuthorizedException();
      } else {
        throw ServerException();
      }
    }
  }

 
}
