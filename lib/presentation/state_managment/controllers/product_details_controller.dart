import 'dart:io';
import 'package:instar/di.dart';
import 'package:instar/domain/entities/rating.dart';
import 'package:instar/domain/entities/review.dart';
import 'package:instar/domain/usecases/rating_usecases/add_rating_usecase.dart';
import 'package:instar/domain/usecases/rating_usecases/delete_rating_usecase.dart';
import 'package:instar/domain/usecases/rating_usecases/get_ratings_usecase.dart';
import 'package:instar/domain/usecases/rating_usecases/update_rating_usecase.dart';
import 'package:instar/domain/usecases/review_usecases/get_all_reviews_usecase.dart';
import 'package:instar/presentation/UI/screens/splash_screen/splash_screen.dart';
import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instar/core/style/colors.dart';
import 'package:instar/core/style/text_style.dart';

class ProductDetailsController extends GetxController {
  int localRate = 0;
  Rating? userRate;

  setRate(int newRate) {
    localRate = newRate;
    update();
  }

  Future<void> getExistingRate(String prodID) async {
    Rating? existingRate;
    final res = await GetRatingsUsecase(sl()).call(prodID);
    res.fold((l) => print('cant get rating'), (r) {
      print(r.toString());
      if (r.length > 0) {
        try {
          existingRate = r.firstWhere((element) =>
              element.productId == prodID &&
              element.userId == SplashScreen.userToken.userId);
        } catch (e) {
          print('$e this user dont has rating');
        }
      }
    });
    if (existingRate == null) {
      final newRate = Rating(
          userId: SplashScreen.userToken.userId, productId: prodID, rating: 0);

      userRate = newRate;
    } else {
      print("existing rate $existingRate");
      userRate = existingRate!;
    }
    localRate = userRate!.rating;
    update();
  }

  Future<void> updateRating(int newRate) async {
    final newRating = Rating(
        id: userRate!.id,
        userId: userRate!.userId,
        productId: userRate!.productId,
        rating: newRate);
    print('new rating $newRating');
    final res = await UpdateRatingUsecase(sl()).call(newRating);
    res.fold((l) => print('cant update rating'), (r) {
      userRate = r;
      localRate = r.rating;
      update();
    });
  }

  Future<void> deleteRating(String rateId) async {
    final res = await DeleteRatingUsecase(sl()).call(rateId);
    res.fold((l) => print("cant delete rating"), (r) {
      localRate = 0;
      update();
    });
  }

  Future<void> addRating(int newRating) async {
    final newRate = Rating(
        userId: userRate!.userId,
        productId: userRate!.productId,
        rating: newRating);
    final res = await AddRatingUsecase(sl()).call(newRate);
    res.fold((l) => print('cant add rate'), (r) {
      userRate = r;
      update();
    });
  }
}
