import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:instar/core/style/colors.dart';
import 'package:instar/domain/entities/user.dart';
import 'package:instar/domain/usecases/authentication_usecases/create_account_usecase.dart';
import 'package:instar/domain/usecases/widhlist_usecases/create_wishlist_usecase.dart';
import 'package:instar/presentation/UI/screens/sign_in/sign_in_screen.dart';
import 'package:email_validator/email_validator.dart';
import 'package:instar/presentation/UI/screens/splash_screen/splash_screen.dart';
import '../../../di.dart';

class SignUpController extends GetxController {
  static bool isPasswordType = false;

  late TextEditingController firstnameController = TextEditingController();
  late TextEditingController lastnameController = TextEditingController();

  late TextEditingController emailController = TextEditingController();
  late TextEditingController passwordController = TextEditingController();
  late TextEditingController confirmPasswordController =
      TextEditingController();
  late TextEditingController phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isPressed = false;
  late BuildContext context;
  //bool isPressed_confirm = false;

  bool isChecked = false;
  void oncheck() {
    isChecked = !isChecked;
  }

  showAlertDialog(BuildContext context) {
    AlertDialog(
      title: const Text("Sign up succeeded"),
      content: const Text("your account is created you can Sign in now"),
      actions: [
        TextButton(
            onPressed: () {
              Get.to(SignIn());
            },
            child: const Text("Ok"))
      ],
    );
  }

  late VoidCallback onClickedSignIn;
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

  String? requiredValidator(String? text) {
    if (text == null || text.trim().isEmpty) {
      return ("this field is required");
    }
    return null;
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

  bool loading = false;

  Future SignUp() async {
    loading = true;
    update();

    try {
      var firstname = firstnameController.text.trim();
      var lastname = lastnameController.text.trim();
      var email = emailController.text.trim();
      var password = passwordController.text.trim();
      var phone = phoneController.text.trim();
      User user = User(
          ban: false,
          role: "user",
          firstName: firstname,
          lastName: lastname,
          email: email,
          phone: phone,
          password: password);
      final res = await CreateAccountUsecase(sl()).call(user);
      res.fold(
          (l) => Fluttertoast.showToast(
              msg: l.message.toString(),
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.black,
              textColor: Colors.white,
              fontSize: 16.0), 
              (r) async {
        print("\n$r");
        final wishlist = await CreateWishListUsecase(sl()).call(userId: r);
        wishlist.fold(
          (l) => print("left wishlist"),
          (r) => Fluttertoast.showToast(
              msg: "wishlist created",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.black,
              textColor: Colors.white,
              fontSize: 16.0),
        );
      });
    } finally {
      loading = false;
      update();
      emailController.text = "";
      firstnameController.text = "";
      lastnameController.text = "";
      passwordController.text = "";
      phoneController.text = "";
      confirmPasswordController.text = "";
    }
  }
}
