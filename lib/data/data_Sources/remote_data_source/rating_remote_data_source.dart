import 'package:instar/data/models/rating_model.dart';

abstract class RatingRemoteDataSource {
  Future<void> addRating(RatingModel rating);
  Future<List<RatingModel>> getRatings(String productID);
  Future<RatingModel> getSingleRating(String ratingID);
  Future<void> deleteRating(String ratingID);
}

class RatingRemoteDataSourceImpl implements RatingRemoteDataSource{
  @override
  Future<void> addRating(RatingModel rating) {
    // TODO: implement addRating
    throw UnimplementedError();
  }

  @override
  Future<void> deleteRating(String ratingID) {
    // TODO: implement deleteRating
    throw UnimplementedError();
  }

  @override
  Future<List<RatingModel>> getRatings(String productID) {
    // TODO: implement getRatings
    throw UnimplementedError();
  }

  @override
  Future<RatingModel> getSingleRating(String ratingID) {
    // TODO: implement getSingleRating
    throw UnimplementedError();
  }
}