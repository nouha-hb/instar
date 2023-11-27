import 'package:dio/dio.dart';
import 'package:instar/core/constant/api_const.dart';
import 'package:instar/core/errors/exceptions/exceptions.dart';
import 'package:instar/data/models/rating_model.dart';

abstract class RatingRemoteDataSource {
  Future<RatingModel> addRating(RatingModel rating);
  Future<List<RatingModel>> getRatings(String productID);
  Future<RatingModel> getSingleRating(String ratingID);
  Future<RatingModel> updateRating(RatingModel newRating);
  Future<void> deleteRating(String ratingID);
  Future<double> getRatingAverage(String productID);
}

class RatingRemoteDataSourceImpl implements RatingRemoteDataSource {
  Dio dio = Dio();

  @override
  Future<RatingModel> addRating(RatingModel rating) async {
    try {
      final response = await dio.post(ApiConst.ratings, data: rating.toJson());
      final data = response.data['review'];
      return RatingModel.fromJson(data);
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<void> deleteRating(String ratingID) async {
    try {
      await dio.delete('${ApiConst.ratings}/$ratingID');
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<List<RatingModel>> getRatings(String productID) async {
    try {
      final response = await dio.get("${ApiConst.products}/$productID/ratings");
      List<dynamic> data = response.data;
      List<RatingModel> ratings =
          data.map((e) => RatingModel.fromJson(e)).toList();
      return ratings;
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<RatingModel> getSingleRating(String ratingID) async {
    try {
      final response = await dio.get('${ApiConst.ratings}/$ratingID');
      final data = response.data;
      return RatingModel.fromJson(data);
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<RatingModel> updateRating(RatingModel newRating) async {
    try {
      print(newRating.toJson());
      final response = await dio.put('${ApiConst.ratings}/${newRating.id}',
          data: newRating.toJson());
      final data = response.data;
      return RatingModel.fromJson(data);
    } catch (e) {
      print(e);
      throw ServerException();
    }
  }
  
  @override
  Future<double> getRatingAverage(String productID) async{
    try {
      final response = await dio.get('${ApiConst.ratings}/$productID/average');
      final data = response.data;
      return double.parse(data);
    } catch (e) {
      throw ServerException();
    }
  }
}
