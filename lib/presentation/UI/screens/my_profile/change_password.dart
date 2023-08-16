import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:instar/core/style/colors.dart';
import 'package:instar/core/style/text_style.dart';
import 'package:instar/presentation/UI/screens/forget_password/passwordSMS.dart';
import 'package:instar/presentation/UI/widgets/custom_button.dart';
import 'package:instar/presentation/UI/widgets/custom_textform.dart';

import '../../../state_managment/controllers/profile_controller.dart';

class ChangePassword extends StatelessWidget {

  ChangePassword({Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
 
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.white,
          title: Text("Nouveau mot de passe"),
          centerTitle: true,
          foregroundColor: AppColors.black,
           leading: IconButton(
              onPressed: () {

                Get.back();
              },
              icon: Icon(Icons.arrow_back_ios)),
        ),
      body: GetBuilder<ProfileController>(
          init: ProfileController(),
          initState: (_) {},
          builder: (controller) {
            return SingleChildScrollView(
              child: Form(
                key: controller.formKey,
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),
                    
                  
                    
                      SizedBox(
                        height: 30.h,
                      ),
                      SizedBox(
                          width: 326.w,
                          height: 40.h,
                          child: TextFormField(
                            controller: controller.passwordController,
                            obscureText: controller.isPressed ? false : true,
                            validator: controller.requiredValidator,
                            keyboardType: TextInputType.visiblePassword,
                            cursorColor: Colors.black,
                            style:
                                TextStyle(color: Colors.black.withOpacity(0.9)),
                            decoration: InputDecoration(
                              enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: AppColors.grey),
                              ),
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: AppColors.primary),
                              ),
                              hintText: "Mot de passe ",
                              hintStyle: AppTextStyle.lightLabelTextStyle,
                              suffixIcon: IconButton(
                                  icon: Icon(controller.isPressed
                                      ? Icons.visibility_off
                                      : Icons.visibility),
                                  color: AppColors.primary,
                                  onPressed: () {
                                    controller.isPressed = !controller.isPressed;
                                    controller.update();
                                  }),
                              labelStyle: AppTextStyle.lightLabelTextStyle,
                              filled: true,
                              floatingLabelBehavior: FloatingLabelBehavior.never,
                              fillColor: Colors.white.withOpacity(0.3),
                            ),
                          )),
                      SizedBox(
                        height: 40.h,
                      ),
                      SizedBox(
                          width: 326.w,
                          height: 40.h,
                          child: TextFormField(
                            controller: controller.confirmPasswordController,
                            obscureText: controller.isPressed ? false : true,
                            validator:
                                controller.requiredConfiemPasswordValidator,
                            keyboardType: TextInputType.visiblePassword,
                            cursorColor: Colors.black,
                            style:
                                TextStyle(color: Colors.black.withOpacity(0.9)),
                            decoration: InputDecoration(
                              enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: AppColors.grey),
                              ),
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: AppColors.primary),
                              ),
                              hintText: "Confirmer le Mot de passe ",
                              hintStyle: AppTextStyle.lightLabelTextStyle,
                              suffixIcon: IconButton(
                                  icon: Icon(controller.isPressed
                                      ? Icons.visibility_off
                                      : Icons.visibility),
                                  color: AppColors.primary,
                                  onPressed: () {
                                    controller.isPressed = !controller.isPressed;
                                    controller.update();
                                  }),
                              labelStyle: AppTextStyle.lightLabelTextStyle,
                              filled: true,
                              floatingLabelBehavior: FloatingLabelBehavior.never,
                              fillColor: Colors.white.withOpacity(0.3),
                            ),
                          )),
                      SizedBox(
                        height: 100.h,
                      ),
                      PrimaryButton(
                          text: "Confirmer",
                          onClick: () {
                            if (controller.formKey.currentState != null &&
                                controller.formKey.currentState!.validate()) {
                                      controller.resetPasswords();
                
                              Get.dialog(AlertDialog(title: Text("Passwords changed "),));
                            }
                          }),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }

  displayToastMessage(String message, BuildContext context) {
    Fluttertoast.showToast(msg: message);
  }
}
