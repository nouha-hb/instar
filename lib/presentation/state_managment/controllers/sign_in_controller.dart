import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  bool isPressed = false;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
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

  // void signIn() async {
  //   inProgress = true;
  //   update();
  //   try {
  //     //Sign in service
  //     // var email = emailController.text;
  //     // var password = passwordController.text;

  //     // UserCredential userCredential = await FirebaseAuth.instance
  //     //     .signInWithEmailAndPassword(email: email.trim(), password: password);

  //     Get.to(const Welcome());
  //   } on FirebaseAuthException catch (e) {
  //       handleSignInError(e);

  //   } finally {
  //     inProgress = false;
  //     if(resetControllers){
  //       emailController.text = "";
  //     passwordController.text = "";
  //     }

  //     update();
  //   }
  // }

  // @override
  // void onInit() {
  //   super.onInit();
  //   resetControllers=true;
  //   update();
  // }

  // void handleSignInError(FirebaseAuthException e) {
  //   String messageToDisplay = "";
  //   resetControllers=false;

  //   switch (e.code) {
  //     case 'ivalid-email':
  //       messageToDisplay = "Your email address appears to be malformed.";
  //       break;
  //     case 'wrong-password':
  //       messageToDisplay = "Your password is wrong.";
  //       break;
  //     case 'user-not-found':
  //       messageToDisplay = "User with this email doesn't exist.";
  //       break;
  //     case 'user-disabled':
  //       messageToDisplay = "User with this email has been disabled.";
  //       break;
  //         case 'opertion-not-allowed':
  //       messageToDisplay = "Signing in with Email and Password is not enabled.";
  //       break;
  //     default:
  //       messageToDisplay = "check your email and password";
  //       break;

  //   }
  //   Get.snackbar( "Sign in failed",messageToDisplay,

  //   duration: Duration(seconds:4),
  //   colorText: Colors.red,
  // margin: EdgeInsets.only(top: 510.0.h),);

  // }
}
