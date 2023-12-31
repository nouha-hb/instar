import 'package:instar/di.dart';
import 'package:instar/domain/entities/Product3D.dart';
import 'package:instar/domain/entities/fournisseur.dart';
import 'package:instar/domain/entities/product.dart';
import 'package:instar/domain/entities/rating.dart';
import 'package:instar/domain/entities/wishlist.dart';
import 'package:instar/domain/usecases/fournisseur_usecases/get_fournisseur_by_id_usecase.dart';
import 'package:instar/domain/usecases/product_3d/get_all_3d_products_usecase.dart';
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
  List<Product3D> textures=[];
  late Product3D currentmodel;
  int salesCount=SplashScreen.cart.sales.length;

 WishList wishList = SplashScreen.wishList!;

 void updateWishlist(){
  wishList=SplashScreen.wishList!;
  update();
 }

  void updateSalesCount(int newCount){
  salesCount=newCount;
  update();
 }

bool isliked=false;
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
    await getProductTextures(product.id);
    currentmodel = textures[0];

    return Future.value(true);
  }

  void getRatingAverage(String prodID) async {
    final res = await GetRatingAverageUsecase(sl()).call(prodID);
    res.fold((l) => avgRate = 0.0, (r) => avgRate = r);
    update();
  }


  Future getProductTextures(String product)async{
    final txtr= await GetAll3DProductsUseCase(sl()).call(product);
    txtr.fold((l) => null, (r) => {
      textures = r
    });
  }




  List<String> get _favProductsId{
  return SplashScreen.wishList!.productsId.map((e) => e.id).toList();
}

  Future<void> favouriteToggle(Product prod) async {
    if (_prodExistInWishlist(prod.id)) {
      SplashScreen.wishList!.productsId.removeAt(_getProdIndex(prod.id));
      isliked = false;
    } else {
      SplashScreen.wishList!.productsId.add(prod);
      isliked = true;
    }
    await UpdateWishListUsecase(sl()).call(wishlist: SplashScreen.wishList!); 
      wishList=SplashScreen.wishList!;
    update();   
  }

  bool likedProduct(String prodId) {
    return _favProductsId.contains(prodId);
  }

  void init(String prodId ){
   isliked = _prodExistInWishlist(prodId) ? true : false;
   update();
  }

  bool _prodExistInWishlist(String prodId){
    for (var element in _favProductsId) {
      if(element == prodId){
        return true;
      }
    }
    return false;
  }
  int  _getProdIndex(String prodId){
    return SplashScreen.wishList!.productsId.indexWhere((element) => element.id==prodId);
  }


  void toggleIcon(){
    isliked= !isliked;
    update();
  }

}