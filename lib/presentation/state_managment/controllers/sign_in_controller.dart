import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instar/core/errors/failures/failures.dart';
import 'package:instar/domain/repositories/authentication_repository.dart';
import 'package:instar/domain/usecases/login_usecase.dart';
import 'package:instar/presentation/UI/screens/sign_up/sign_up_screen.dart';

import '../../../core/errors/exceptions/exceptions.dart';

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

//   Future<void> signIn() async {
//     inProgress = true;
//     update();
//     try {
//       // Sign in service
//       var email = usernameController.text;
//       var password = passwordController.text;
//       final res =await LoginUsecase().call(email: email.trim(), password: password);

//       res.fold((l) {
//         print("error");
//       }, (r) {
// Get.to(const SignUp());
//       });

      
//     }  finally {
//       inProgress = false;
//       if (resetControllers) {
//         usernameController.text = "";
//         passwordController.text = "";
//       }

//       update();
//     }
//   }

//   @override
//   void onInit() {
//     super.onInit();
//     resetControllers = true;
//     update();
//   }

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
