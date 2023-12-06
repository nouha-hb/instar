import 'package:instar/di.dart';
import 'package:instar/domain/entities/fournisseur.dart';
import 'package:instar/domain/entities/product.dart';
import 'package:instar/domain/entities/rating.dart';
import 'package:instar/domain/usecases/fournisseur_usecases/get_fournisseur_by_id_usecase.dart';
import 'package:instar/domain/usecases/rating_usecases/add_rating_usecase.dart';
import 'package:instar/domain/usecases/rating_usecases/delete_rating_usecase.dart';
import 'package:instar/domain/usecases/rating_usecases/get_rating_average_use_case.dart';
import 'package:instar/domain/usecases/rating_usecases/get_ratings_usecase.dart';
import 'package:instar/domain/usecases/rating_usecases/update_rating_usecase.dart';
import 'package:instar/domain/usecases/widhlist_usecases/update_wishlist_usecase.dart';
import 'package:instar/presentation/UI/screens/splash_screen/splash_screen.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ProductDetailsController extends GetxController {
  int localRate = 0;
  Rating? userRate;
  int numberRates = 0;
  int orderedQuantity = 1;
  double avgRate = 0.0;
  late Fournisseur provider;
  bool isLiked = false;

  setRate(int newRate) {
    localRate = newRate;
  }

  void incQuantity(int productQuantity) {
    if (productQuantity > orderedQuantity) {
      orderedQuantity++;
    }
    update();
  }

  void decQuantity() {
    if (orderedQuantity > 1) {
      orderedQuantity--;
    }
    update();
  }

  Future<void> getExistingRate(String prodID) async {
    Rating? existingRate;
    isLiked = SplashScreen.wishList!.productsId.contains(prodID);
    final res = await GetRatingsUsecase(sl()).call(prodID);
    res.fold((l) => print('cant get rating'), (r) {
      numberRates = r.length;

      if (r.isNotEmpty) {
        try {
          getRatingAverage(prodID);
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
      userRate = existingRate!;
    }
    localRate = userRate!.rating;
    update();
  }

  Future<void> updateRating(int newRate) async {
    print("rating: update rating");
    final newRating = Rating(
        id: userRate!.id,
        userId: userRate!.userId,
        productId: userRate!.productId,
        rating: newRate);
    final res = await UpdateRatingUsecase(sl()).call(newRating);
    res.fold((l) => print('cant update rating'), (r) {
      userRate = r;
      localRate = r.rating;
      getRatingAverage(userRate!.productId);
      update();
    });
  }

  Future<void> deleteRating(String rateId) async {
    print("rating: delete rating");
    final res = await DeleteRatingUsecase(sl()).call(rateId);
    res.fold((l) => print("cant delete rating"), (r) {
      localRate = 0;
      numberRates--;
      getRatingAverage(userRate!.productId);
      update();
    });
  }

  Future<void> addRating(int newRating) async {
    print("rating: add rating");
    final newRate = Rating(
        userId: userRate!.userId,
        productId: userRate!.productId,
        rating: newRating);
    final res = await AddRatingUsecase(sl()).call(newRate);
    res.fold((l) => print('cant add rate'), (r) {
      userRate = r;
      numberRates++;
      getRatingAverage(userRate!.productId);
      update();
    });
  }

  Future getProvider(String providerID) async {
    final res = await GetFournisseursByIdUsecase(sl()).call(providerID);
    res.fold((l) => print(l), (r) => provider = r);
  }

  Future<bool> loadData(Product product) async {
    //await getExistingRate(product.id);
    await getProvider(product.provider);

    return Future.value(true);
  }

  void getRatingAverage(String prodID) async {
    final res = await GetRatingAverageUsecase(sl()).call(prodID);
    res.fold((l) => avgRate = 0.0, (r) => avgRate = r);
    update();
  }

  void favouriteToggle(String prodId) async {
    if (isLiked && SplashScreen.wishList!.productsId.contains(prodId)) {
      SplashScreen.wishList!.productsId.remove(prodId);
      isLiked = !isLiked;
    } else {
      SplashScreen.wishList!.productsId.add(prodId);
      isLiked = !isLiked;
    }
    await UpdateWishListUsecase(sl()).call(wishlist: SplashScreen.wishList!);
    update();
  }
}
