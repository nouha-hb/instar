import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instar/domain/usecases/authentication_usecases/facebook_login_usecase.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:instar/presentation/UI/screens/splash_screen/splash_screen.dart';
import '../../../di.dart';
import '../../../domain/usecases/authentication_usecases/login_usecase.dart';

class SignInController extends GetxController {
  bool isPressed = false;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var isSignedIn = false.obs;
  var displayName = '';
  bool inProgress = false;
  bool resetControllers = true;
  final formKey = GlobalKey<FormState>();
  late BuildContext context;
  String? requiredEmailValidator(String? text) {
    if (text == null || text.trim().isEmpty) {
      return ("this field is required");
    }
    bool isvalid = EmailValidator.validate(text);
    if (isvalid.toString() == 'false') {
      return ("Invalid email form");
    }
    return null;
  }

  String? requiredPasswordValidator(String? confirmPasswordText) {
    if (confirmPasswordText == null || confirmPasswordText.trim().isEmpty) {
      return ("this field is required");
    }
    if (confirmPasswordText.length < 6) {
      return ("Password should be atleast 6 characters");
    }
    if (confirmPasswordText.length > 15) {
      return ("Password should be atleast 6 characters");
    }

    return null;
  }

  String? requiredValidator(String? text) {
    if (text == null || text.trim().isEmpty) {
      return ("This field is required");
    }
    return null;
  }

  Future<void> FacebookLogin() async {
    try {
      final res = await FacebookLoginUsecase(sl()).call();
      res.fold((l) {
        Fluttertoast.showToast(
            msg: l.message.toString(),
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0);
      }, (r) {
        print("success");
      });
    } finally {}
  }

  Future<void> signIn(BuildContext context) async {
    print("sign in method");
    inProgress = true;
    update();
    try {
      // Sign in service
      var email = usernameController.text;
      var password = passwordController.text;
      final res = await LoginUsecase(sl())
          .call(email: email.trim(), password: password);

      res.fold((l) {
        Fluttertoast.showToast(
            msg: l.message.toString(),
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0);
        print("left $l");
      }, (r) async{
        await SplashScreen.init(context, 1);
        print("right");
      });
    } finally {
      inProgress = false;
      print("finally");
      if (resetControllers) {
        // usernameController.text = "";
        // passwordController.text = "";
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
