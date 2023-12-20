import 'package:dio/dio.dart';
import 'package:instar/data/models/wishlist_model.dart';
import 'package:instar/di.dart';
import 'package:instar/domain/entities/product.dart';
import 'package:instar/domain/usecases/product_usecases/get_one_product_usecase.dart';
import '../../../core/constant/api_const.dart';
import '../../../core/errors/exceptions/exceptions.dart';
import '../local_data_source/authentication_local_data_source.dart';

abstract class WishlistRemoteDataSource {
  Future<void> createWishlist({required String userId});
  Future<void> updateWishlist({required WishListModel wishlist});
  Future<WishListModel> getWishlist({required String userId});
}

class WishlistRemoteDataSourceImpl implements WishlistRemoteDataSource {
  Dio dio = Dio();

  Future<String> get token async {
    final tk = await AuthenticationLocalDataSourceImpl().getUserInformations();
    return tk.token;
  }

  @override
  Future<void> createWishlist({required String userId}) async {
    try {
      await dio.post(
        ApiConst.wishlist,
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
  Future<WishListModel> getWishlist({required String userId}) async {
    try {
      final response = await dio.get(
        "${ApiConst.getWishlist}/$userId",
        options: Options(
          headers: {
            "authorization": "Bearer ${await token}",
          },
        ),
      );
      final data = response.data; 
      List<Product> prods=[];
       for (var element in data['products']) {
        final rs= await GetOneProductsUsecase(sl()).call(element);
       rs.fold((l) => null, (r) => prods.add(r));
      }
     data['products']=prods;
      WishListModel wishlist = WishListModel.fromJson(data);
      return wishlist;
    } on DioException catch (e) {
      if (e.response!.statusCode == 401) {
        throw NotAuthorizedException();
      } else {
        print(e);
        throw ServerException();
      }
    }
  }

  @override
  Future<void> updateWishlist({required WishListModel wishlist}) async {
      Map<String,dynamic> dt = wishlist.toJson();
   dt['products']=wishlist.productsId.map((e) => e.id).toList();
    try {
     final response = await dio.put(
        "${ApiConst.wishlist}/${wishlist.id}",
        data:dt,
        options: Options(
          headers: {
            "authorization": "Bearer ${await token}",
          },
        ),
      );
    } on DioException catch (e) {
      print('fav error $e');
      if (e.response!.statusCode == 401) {
        throw NotAuthorizedException();
      } else {
        throw ServerException();
      }
    }
  }
}