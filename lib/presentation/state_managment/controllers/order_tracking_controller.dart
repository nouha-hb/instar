import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:instar/domain/entities/reclamation.dart';
import 'package:instar/domain/usecases/product_usecases/get_one_product_usecase.dart';
import 'package:instar/domain/usecases/sales_usecases/get_single_sale_usecase.dart';

import '../../../di.dart';
import '../../../domain/entities/product.dart';
import '../../../domain/entities/sales.dart';

class OrderTrackingController extends  GetxController{
  List<Sales> salesList=[];
  List<Product> products=[];
  int selected=0;
  late Sales sale;

  void selecteSale(int index)
{
  selected = index;
  update();
}

void changeSale(String prodId){
  sale = salesList.firstWhere((element) => element.productId==prodId);
  update();
}

int getSaleStep(String step){
  switch (step) {
    case 'Confirmation de commande':
      return 0;
     case 'Traitement en cours':
      return 1;
       case 'En cours de préparation':
      return 2;
       case 'Expédition':
      return 3;
       case 'Livraison':
      return 4;
  }
return 0;
}

  Future<bool> getSales(Reclamation reclamation)async{
    if(salesList.isNotEmpty){
      return false;
    }
    for(String s in reclamation.sales){
      final sale = await GetSingleSalesUsecase(sl()).call(s);
      sale.fold((l) => null, (r) async{
        salesList.add(r);
      });
    }
    sale=salesList[0];
    await getProduct();
    return true;
  }

  Future getProduct()async{
    for(Sales sal in salesList){
       final res = await GetOneProductsUsecase(sl()).call(sal.productId);
    res.fold((l) => print('pro $l'), (r) {
      if(!products.contains(r)){
        products.add(r);
      }
    });
    }
   
  } 


}