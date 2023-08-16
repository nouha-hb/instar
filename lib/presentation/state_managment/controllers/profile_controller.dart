import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  String username = "username";
  String email = "email";
  late TextEditingController passwordController = TextEditingController();
  late TextEditingController confirmPasswordController =
      TextEditingController();
  late TextEditingController phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isPressed = false;
  bool isPressed_confirm = false;
  void resetName() {
    usernameController.text = "";
    update();
  }

  void resetEmail() {
    emailController.text = "";
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

  void change_name(String name) {
    this.username = name;
    update();
    
  }

  void change_email(String email) {
    this.email = email;
    update();
  }

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
}
