import 'package:dio/dio.dart';
import 'package:instar/data/models/review_model.dart';

import '../../../core/constant/api_const.dart';
import '../../../core/errors/exceptions/exceptions.dart';
import '../../../domain/entities/review.dart';

abstract class ReviewRemoteDataSource {
  Future<void> addReview(Review reviewModel);
  Future<List<ReviewModel>> getAllReviews(String prodId);
  Future<void> updateReview(Review review);
  Future<void> removeReview(String id);
}

class RevieReviewRemoteDataSourceImpl implements ReviewRemoteDataSource {
  Dio dio = Dio();

  @override
  Future<void> addReview(Review review) async {
    try {
      ReviewModel reviewModel = ReviewModel(userID:review.userID, productID: review.productID, rating: review.rating, comment: review.comment, image: review.image, id: review.id);

      await dio.post(
        "${ApiConst.products}/${reviewModel.productID}/reviews",data:reviewModel.toJson() 
      );
    }catch (e) {
        throw ServerException();
      }
    
  }

  @override
  Future<List<ReviewModel>> getAllReviews(String prodId) async{
     try {
      final response = await dio.get(
       "${ApiConst.products}/$prodId/reviews"
      );
      List<dynamic> data = response.data;
      List<ReviewModel> products =
          data.map((e) => ReviewModel.fromJson(e)).toList();
      return products;
    } catch (e) {
      
        throw ServerException();
      
    }
  }

  @override
  Future<void> removeReview(String prodId) async{
    try {
      await dio.delete(
        "${ApiConst.reviews}/$prodId");
    }catch (e) {
        throw ServerException();
      }
  }

  @override
  Future<void> updateReview(Review review) async{
   try {
      ReviewModel reviewModel = ReviewModel(userID:review.userID, productID: review.productID, rating: review.rating, comment: review.comment, image: review.image, id: review.id);

      await dio.put(
         "${ApiConst.reviews}/${reviewModel.productID}",data:reviewModel.toJson() 
      );
    }catch (e) {
        throw ServerException();
      }
  }
}
