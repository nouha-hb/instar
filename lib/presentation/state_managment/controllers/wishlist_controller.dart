import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:instar/di.dart';
import 'package:instar/domain/entities/product.dart';
import 'package:instar/domain/entities/wishlist.dart';
import 'package:instar/domain/usecases/widhlist_usecases/update_wishlist_usecase.dart';
import 'package:instar/presentation/UI/screens/splash_screen/splash_screen.dart';

class WishListController extends GetxController{
 bool isliked = false;
 WishList wishList = SplashScreen.wishList!;

 void updateWishlist(){
  wishList=SplashScreen.wishList!;
  update();
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