import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:instar/domain/entities/fournisseur.dart';
import 'package:instar/domain/entities/product.dart';
import 'package:instar/domain/usecases/category_usecases/get_categories_usecase.dart';
import 'package:instar/domain/usecases/fournisseur_usecases/get_fournisseur_by_id_usecase.dart';
import 'package:instar/domain/usecases/fournisseur_usecases/get_fournisseurs_usecase.dart';
import 'package:instar/domain/usecases/product_usecases/get_all_products_usecase.dart';
import 'package:instar/presentation/UI/screens/splash_screen/splash_screen.dart';

import '../../../di.dart';
import '../../../domain/entities/category.dart';

class AdminHomeController extends GetxController {
  List<Product> products=[];
  List<Category> providerCategories=[];
  late Fournisseur provider;

  Future<void> getProducts(String providerID)async{
    final allProducts = await GetAllProductsUsecase(sl()).call();
    allProducts.fold((l) => null, (r) {
       products=r.where((element) => element.provider==providerID).toList();
    });
  //update();
  }
  Future<void> getProviderCategories()async{
    final allCategories=await GetAllCategoriesUsecase(sl()).call();
    allCategories.fold((l) => null, (r){
      for (Category category in r){
        for(Product product in products){
          if(product.category==category.name && !providerCategories.contains(category)){
            providerCategories.add(category);
          }
        }
      }
    });
  //  update();
  }
  
  Future<void> getProvider(String id)async{
    final res =await GetAllFournisseursUsecase(sl()).call();
    res.fold((l) => null, (r) {
      provider=r.firstWhere((element) => element.id == id);
    });
  }
  
  Future loadProviderData(String userID)async{
    bool res=false;
    await getProvider(userID);
    await getProducts(provider.id);
    await getProviderCategories();
    print("prods : $products");
    print("cat : $providerCategories");
        print("prov : $provider");

    res = true;
    return res;
  }
}