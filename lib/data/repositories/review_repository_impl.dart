import 'package:dartz/dartz.dart';
import 'package:instar/core/errors/failures/failures.dart';
import 'package:instar/data/data_Sources/remote_data_source/review_remote_data_source.dart';
import 'package:instar/domain/entities/review.dart';
import 'package:instar/domain/repositories/review_repository.dart';

import '../../core/errors/exceptions/exceptions.dart';

class ReviewRepositoryImpl implements ReviewRepository {
  final ReviewRemoteDataSource reviewRemoteDataSource;

  ReviewRepositoryImpl(this.reviewRemoteDataSource);


  @override
  Future<Either<Failure, Unit>> addReview(Review review) async{
     try {
      await reviewRemoteDataSource.addReview(review);
      return const Right(unit);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<Review>>> getAllReviews(String prodId) async{
        try {
      final reviewModels = await reviewRemoteDataSource.getAllReviews(prodId);
      final reviews = reviewModels
          .map((e) => Review(id: e.id, userID: e.userID, productID: e.productID,date:e.date, comment: e.comment, image: e.image,userImage: e.userImage,userName: e.userName))
          .toList();
      return right(reviews);
    } on NotAuthorizedException {
      return left(NotAuthorizedFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> removeReview(String prodId) async{
      try {
      await reviewRemoteDataSource.removeReview(prodId);
      return const Right(unit);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> updateReview(Review review) async{
      try {
      await reviewRemoteDataSource.updateReview(review);
      return const Right(unit);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
