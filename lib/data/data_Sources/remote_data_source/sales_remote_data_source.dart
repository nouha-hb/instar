import 'package:dio/dio.dart';
import 'package:instar/data/models/sales_model.dart';
import '../../../core/constant/api_const.dart';
import '../../../core/errors/exceptions/exceptions.dart';

abstract class SalesRemoteDataSource{
  Future<List<SalesModel>> getAllSales();
  Future<SalesModel> getSingleSales(String id);
  Future<void> deleteSales(String id);
  Future<SalesModel> addSale(SalesModel newSale);
}

class SalesRemoteDataSourceImp implements SalesRemoteDataSource{
    Dio dio = Dio();

  @override
  Future<SalesModel> addSale(SalesModel newSale) async {
      try {
      final res = await dio.post("${ApiConst.sales}/create", data: newSale.toJson());
     return SalesModel.fromJson(res.data['sale']); 
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
  
  @override
  Future<void> deleteSales(String id) async{
     try {
      final response = await dio.delete('${ApiConst.sales}/one/$id');
    } catch (e) {
      //print('sl error ${e.toString()}');
      throw ServerException();
    }
  }
} 