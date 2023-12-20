import 'package:dio/dio.dart';
import 'package:instar/di.dart';
import 'package:instar/domain/entities/sales.dart';
import 'package:instar/domain/usecases/sales_usecases/get_single_sale_usecase.dart';
import '../../../core/constant/api_const.dart';
import '../../../core/errors/exceptions/exceptions.dart';
import '../../models/cart_model.dart';
import '../local_data_source/authentication_local_data_source.dart';

abstract class CartRemoteDataSource {
  Future<void> createCart({required String userId});
  Future<CartModel> updateCart(
      {required CartModel cart});
  Future<CartModel> getCart({required String userId});
}

class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  Dio dio = Dio();

  Future<String> get token async {
    final tk = await AuthenticationLocalDataSourceImpl().getUserInformations();
    return tk.token;
  }
  
  @override
  Future<void> createCart({required String userId}) async{
     try {
       await dio.post(
        ApiConst.cart,
        data: {"userId": userId},
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
      List<Sales> sal=[];
      for (var element in data['sales']) {
       final rs= await GetSingleSalesUsecase(sl()).call(element);
       rs.fold((l) => null, (r) => sal.add(r));
      }
      data['sales']=sal;
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
  Future<CartModel> updateCart({required CartModel cart}) async{
   try {
   Map<String,dynamic> dt = cart.toJson();
   dt['sales']=cart.sales.map((e) => e.id).toList();
   print('my c cart ${dt}');
     final response =  await dio.put(
        "${ApiConst.cart}/${cart.id}",
        data: dt,
        options: Options(
          headers: {
            "authorization": "Bearer ${await token}",
          },
        ),
      );
        final data = response.data;
      List<Sales> sal=[];
      for (var element in data['sales']) {
       final rs= await GetSingleSalesUsecase(sl()).call(element);
       rs.fold((l) => null, (r) => sal.add(r));
      }
      data['sales']=sal;
      CartModel rs = CartModel.fromJson(data);
      return rs;
    } on DioException catch (e) {
      print("cart error ${e.toString()}");
        {
        throw ServerException();
      }
    }
  }

 
}