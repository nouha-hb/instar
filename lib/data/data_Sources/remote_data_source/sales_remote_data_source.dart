import 'package:dio/dio.dart';
import 'package:instar/data/models/sales_model.dart';

import '../../../core/constant/api_const.dart';
import '../../../core/errors/exceptions/exceptions.dart';

abstract class SalesRemoteDataSource{
  Future<List<SalesModel>> getAllSales();
  Future<SalesModel> getSingleSales(String id);
  Future<void> addSale(SalesModel newSale);
}

class SalesRemoteDataSourceImp implements SalesRemoteDataSource{
    Dio dio = Dio();

  @override
  Future<void> addSale(SalesModel newSale) async {
      try {
      await dio.post(ApiConst.ratings, data: newSale.toJson());
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<List<SalesModel>> getAllSales() async{
     try {
      final response = await dio.get(ApiConst.sales);
      List<dynamic> data = response.data;
      List<SalesModel> sales =
          data.map((e) => SalesModel.fromJson(e)).toList();
      return sales;
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<SalesModel> getSingleSales(String id) async{
       try {
      final response = await dio.get('${ApiConst.sales}/one/$id');
      final data = response.data;
      //print('sl $data');
      return SalesModel.fromJson(data);
    } catch (e) {
      //print('sl error ${e.toString()}');
      throw ServerException();
    }
  }
} 