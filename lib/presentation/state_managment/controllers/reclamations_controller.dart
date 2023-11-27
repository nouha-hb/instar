import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:instar/domain/entities/reclamation.dart';
import 'package:instar/domain/usecases/reclamation_usecases/get_all_reclamations_usecase.dart';
import 'package:instar/presentation/UI/screens/splash_screen/splash_screen.dart';

import '../../../di.dart';

class RaclamationsController extends GetxController{
  List<Reclamation> commands=[];


  Future<bool> getCommands() async{
    final res = await GetAllReclamationsUsecase(sl()).call(SplashScreen.userToken.userId);
    res.fold((l) => null, (r) => commands=r);
    return true;
  }

}