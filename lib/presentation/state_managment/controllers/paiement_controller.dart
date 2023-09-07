import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instar/core/errors/failures/failures.dart';
import 'package:instar/domain/repositories/authentication_repository.dart';
import 'package:instar/domain/usecases/authentication_usecases/facebook_login_usecase.dart';
import 'package:instar/presentation/UI/screens/main_page/main_page.dart';
import 'package:instar/presentation/UI/screens/sign_up/sign_up_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../core/errors/exceptions/exceptions.dart';
import '../../../di.dart';
import '../../../domain/entities/paiement.dart';
import '../../../domain/usecases/authentication_usecases/login_usecase.dart';
import '../../../domain/usecases/paiement_usecases/paiement_usecase.dart';

class PaiementController extends GetxController {
  bool isPressed = false;
  TextEditingController NomController = TextEditingController();
  TextEditingController CodeController = TextEditingController();
  TextEditingController DateExpController = TextEditingController();
  TextEditingController CVVController = TextEditingController();

  var isSignedIn = false.obs;
  var displayName = '';
  bool inProgress = false;
  bool resetControllers = true;
  final formKey = GlobalKey<FormState>();

  String? requiredValidator(String? text) {
    if (text == null || text.trim().isEmpty) {
      return ("This field is required");
    }
    return null;
  }

  Future<void> paiement() async {
    inProgress = true;
    update();
    try {
      var Nom = NomController.text.trim();
      var Code = CodeController.text.trim();
      var DateExp = DateExpController.text.trim();
      var CVV = CVVController.text.trim();

      Paiement paiement = new Paiement(
        Nom: Nom,
        Code: Code,
        DateExp: DateExp,
        CVV: CVV,
      );

      final res = await PaiementUsecase(sl()).call(paiement);

      res.fold((l) {
        print("left paiementttttttttt");
        Fluttertoast.showToast(
            msg: l.message.toString(),
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0);
      }, (r) {
        print("right paiementttttttt");
        Get.to(const MainPage());
      });
    } finally {
      inProgress = false;
      if (resetControllers) {
        NomController.text = "";
        CodeController.text = "";
        DateExpController.text = "";
        CVVController.text = "";
      }

      update();
    }
  }

  @override
  void onInit() {
    super.onInit();
    resetControllers = true;
    update();
  }
}
