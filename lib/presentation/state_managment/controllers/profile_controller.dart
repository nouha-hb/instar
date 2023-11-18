
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instar/domain/usecases/authentication_usecases/update_profil_usecase.dart';
import 'package:instar/presentation/UI/screens/splash_screen/splash_screen.dart';

import '../../../di.dart';
import '../../../domain/entities/user.dart';

class ProfileController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  static String name = SplashScreen.currentUser.firstName;
  static String lastName = SplashScreen.currentUser.lastName;
  static String phone = SplashScreen.currentUser.phone;
  static String password = SplashScreen.currentUser.password;
  final formKey = GlobalKey<FormState>();
  final formKeypass = GlobalKey<FormState>();

  late TextEditingController passwordController = TextEditingController();
  late TextEditingController confirmPasswordController =
      TextEditingController();
  TextEditingController phoneController = TextEditingController();

  bool isPressed = false;
  bool isPressed_confirm = false;
  void resetName() {
    nameController.text = "";
    update();
  }

  void resetLastName() {
    lastnameController.text = "";
    update();
  }

  void resetPasswords() {
    passwordController.text = "";
    confirmPasswordController.text = "";
    update();
  }

  void resetPhone() {
    phoneController.text = "";
    update();
  }

  String? requiredValidator(String? text) {
    if (text == null || text.trim().isEmpty) {
      return ("This field is required");
    }
    return null;
  }

  bool isChecked = false;
  void oncheck() {
    isChecked = !isChecked;
  }

  String? requiredPhoneValidator(String? text) {
    if (text == null || text.trim().isEmpty) {
      return ("this field is required");
    }
    if (text.length != 8) {
      return ("phone number should be 8 numbers");
    }
    return null;
  }

  String? requiredConfiemPasswordValidator(String? confirmPasswordText) {
    if (confirmPasswordText == null || confirmPasswordText.trim().isEmpty) {
      return ("this field is required");
    }
    if (confirmPasswordText.length < 6) {
      return ("Password should be atleast 6 characters");
    }
    if (confirmPasswordText.length > 15) {
      return ("Password should be atleast 6 characters");
    }
    if (passwordController.text != confirmPasswordText) {
      return "passwords don't match";
    }
    return null;
  }

  Future change_name(String name) async {
    try {
      ProfileController.name = name;
      update();
      User user = User(
          ban: SplashScreen.currentUser.ban,
          role: SplashScreen.currentUser.role,
          firstName: nameController.text,
          lastName: ProfileController.name,
          email: SplashScreen.currentUser.email,
          phone: SplashScreen.currentUser.phone,
          password: SplashScreen.currentUser.password);
      final res = await UpdateProfilUsecase(sl()).call(user);
      res.fold((l) => print("user update left"), (r) {});
      print("update profile right");
      print(SplashScreen.currentUser.firstName);
      update();
    } on Exception catch (e) {
      print(e);
    }
  }

  Future change_password(String password) async {
    try {
      ProfileController.password = password;
      update();
      User user = User(
          ban: SplashScreen.currentUser.ban,
          role: SplashScreen.currentUser.role,
          firstName: ProfileController.name,
          lastName: ProfileController.name,
          email: SplashScreen.currentUser.email,
          phone: ProfileController.phone,
          password: password);
      final res = await UpdateProfilUsecase(sl()).call(user);
      res.fold((l) => print("user update phone left"), (r) {});
      print("update profile password right");

      update();
    } on Exception catch (e) {
            print(e);

    }
  }

  Future change_phone(String phone) async {
    try {
      ProfileController.phone = phone;
      update();
      User user = User(
          ban: SplashScreen.currentUser.ban,
          role: SplashScreen.currentUser.role,
          firstName: ProfileController.name,
          lastName: ProfileController.name,
          email: SplashScreen.currentUser.email,
          phone: phone,
          password: SplashScreen.currentUser.password);
      final res = await UpdateProfilUsecase(sl()).call(user);
      res.fold((l) => print("user update phone left"), (r) {});
      print("update profile phone right");

      update();
    } on Exception catch (e) {
           print(e);

    }
  }

  Future change_LastName(String lastname) async {
    try {
      ProfileController.lastName = lastname;
      update();
      User user = User(
          ban: SplashScreen.currentUser.ban,
          role: SplashScreen.currentUser.role,
          firstName: ProfileController.name,
          lastName: lastnameController.text,
          email: SplashScreen.currentUser.email,
          phone: SplashScreen.currentUser.phone,
          password: SplashScreen.currentUser.password);
      final res = await UpdateProfilUsecase(sl()).call(user);
      res.fold((l) => print("user update left"), (r) {});
      print("update profile right");
      print(SplashScreen.currentUser.firstName);
      update();
    } on Exception catch (e) {
            print(e);

    }
  }

  // String? requiredEmailValidator(String? text) {
  //   if (text == null || text.trim().isEmpty) {
  //     return ("this field is required");
  //   }
  //   // bool isvalid = EmailValidator.validate(text);
  //   // if (isvalid.toString() == 'false') {
  //   //   return ("Invalid email form");
  //   // }
  //   return null;
  // }
}
