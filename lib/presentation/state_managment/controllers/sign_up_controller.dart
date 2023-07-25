import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instar/presentation/UI/screens/sign_in/sign_in_screen.dart';

class SignUpController extends GetxController {
  static bool isPasswordType = false;

  late TextEditingController nameController = TextEditingController();
  late TextEditingController surnameController = TextEditingController();
  late TextEditingController hobbiesController = TextEditingController();

  late TextEditingController emailController = TextEditingController();
  late TextEditingController passwordController = TextEditingController();
  late TextEditingController confirmPasswordController =
      TextEditingController();
  late TextEditingController phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isPressed = false;
  bool isPressed_confirm = false;

  bool isChecked = false;
  void oncheck() {
    isChecked = !isChecked;
  }

  late VoidCallback onClickedSignIn;
  String? requiredValidator(String? text) {
    if (text == null || text.trim().isEmpty) {
      return ("this field is required");
    }
    return null;
  }

  String? requiredConfiemPasswordValidator(String? confirmPasswordText) {
    if (confirmPasswordText == null || confirmPasswordText.trim().isEmpty) {
      return ("this field is required");
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
      // UserCredential userCredential = await FirebaseAuth.instance
      //     .createUserWithEmailAndPassword(
      //         email: emailController.text.trim(),
      //         password: passwordController.text);
      // await FirebaseFirestore.instance.collection('users').add({
      //   'username': nameController.text.trim(),
      //   'surname': surnameController.text.trim(),
      //   'hobbies': hobbiesController.text.trim(),
      //   'email': emailController.text.trim(),
      //   'password': passwordController.text.trim(),
      //   'phone': phoneController.text.trim(),
      //   'image_path': imageFile!.path.toString(),
      // });
      await Get.dialog(
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
        ),
      );
    } finally {
      loading = false;
      update();
      loading = false;
      emailController.text = "";
      nameController.text = "";
      surnameController.text = "";
      passwordController.text = "";
      phoneController.text = "";
      hobbiesController.text = "";
      confirmPasswordController.text = "";
    }
  }
}
