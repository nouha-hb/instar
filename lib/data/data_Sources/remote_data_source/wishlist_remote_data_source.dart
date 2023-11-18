import 'package:dio/dio.dart';
import 'package:instar/data/models/wishlist_model.dart';
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
    try {
      await dio.put(
        "${ApiConst.wishlist}/${wishlist.id}",
        data: {
          "userId": wishlist.userId,
          "products": wishlist.productsId
        },
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
