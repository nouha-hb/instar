import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:instar/domain/entities/product.dart';

class CategoryPageController extends GetxController {
  List<Product> products=[];

  void getProductsByCategory(String category,List<Product> allProducts){
    products=allProducts.where((element) => element.category==category).toList();
    update();
  }
}