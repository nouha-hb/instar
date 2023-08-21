import 'package:dio/dio.dart';
import 'package:instar/data/models/promotion_model.dart';

import '../../../core/constant/api_const.dart';
import '../../../core/errors/exceptions/exceptions.dart';

abstract class PromotionRemoteDataSource {
  Future<List<PromotionModel>> getAllPromotions();
}

class PromotionRemoteDataSourceImpl implements PromotionRemoteDataSource{
  Dio dio = Dio();

  @override
  Future<List<PromotionModel>> getAllPromotions() async{
    try {
      final response = await dio.get(
        ApiConst.getPromotions,
      );
      List<dynamic> data = response.data;
      List<PromotionModel> products =
          data.map((e) => PromotionModel.fromJson(e)).toList();
      return products;
    } catch (e) {
        throw ServerException();
      
    }
  }

}