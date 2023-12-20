import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:instar/data/models/cart_model.dart';
import 'package:instar/di.dart';
import 'package:instar/domain/entities/cart.dart';
import 'package:instar/domain/entities/sales.dart';
import 'package:instar/domain/usecases/cart_usecases/update_cart_usecase.dart';
import 'package:instar/domain/usecases/sales_usecases/add_sale_usecase.dart';
import 'package:instar/domain/usecases/sales_usecases/delete_sale_usecase.dart';
import 'package:instar/domain/usecases/sales_usecases/get_single_sale_usecase.dart';
import 'package:instar/presentation/UI/screens/splash_screen/splash_screen.dart';

class CartController extends GetxController{
  int items = SplashScreen.cart.sales.length;

 Future addSale(Sales newSale)async{
  if(!sailExist(newSale.productId)){
    final addsale = await AddSaleUsecase(sl()).call(newSale);
    addsale.fold((l) => null, (r) async{
      SplashScreen.cart.sales.add(r);
      await _updateSailes();
    });
  }else{
     Fluttertoast.showToast(
            msg: 'product already in cart!',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0);
  }
  print("Sales list add ${SplashScreen.cart.sales}");
 }

Future deleteSale(String saleId)async{
  await DeleteSaleUsecase(sl()).call(saleId); 
  SplashScreen.cart.sales.removeWhere((element) => element.id==saleId);
  await _updateSailes();
    print("Sales list delete ${SplashScreen.cart.sales}");

  update();
}
Future _updateSailes()async{

  final rs = await UpdateCartUsecase(sl()).call(cart: SplashScreen.cart);
    rs.fold((l) => null, (r)  async {
   
              print("Sales list update ${SplashScreen.cart.sales}");

    });
     // print("Sales list update ${SplashScreen.cart.sales}");

    update();
}

bool sailExist(String productID){
  for (var element in SplashScreen.cart.sales) {
    if((element as Sales).productId==productID){
      return true;
    }
  }
  return false;}

  List<String?> get getStringSaleProducts{
    print('sales lis ${SplashScreen.cart.sales}');
    print((SplashScreen.cart.sales[0] as Sales).totalPrice );
    return SplashScreen.cart.sales.map((e) => (e as Sales).productId).toList();
  }

Future updateSale(String sailId)async{
  //await UpdateSa

}

Future confirmSales()async{
 //TODO: confirm sales
}
  
}