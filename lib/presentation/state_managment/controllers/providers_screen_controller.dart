import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:instar/domain/entities/fournisseur.dart';
import 'package:instar/domain/usecases/fournisseur_usecases/get_fournisseurs_usecase.dart';

import '../../../di.dart';

class ProvidersScreenController extends GetxController {
List<Fournisseur> providers=[];
  Future<bool> getAllProviders()async{
    final res = await GetAllFournisseursUsecase(sl()).call();
    res.fold((l) => null, (r) => providers=r);
   // update();
    return true;
  }
}