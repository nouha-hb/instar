import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:instar/core/style/colors.dart';
import 'package:instar/core/style/text_style.dart';
import 'package:instar/presentation/UI/widgets/custom_button.dart';

import '../../../state_managment/controllers/sign_up_controller.dart';
import '../../widgets/custom_textform.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GetBuilder<SignUpController>(
            init: SignUpController(),
            initState: (_) {},
            builder: (controller) {
              return Form(
                key: controller.formKey,
                child: SingleChildScrollView(
                  reverse: false,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50.h,
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: const Icon(
                              Icons.arrow_back_ios,
                              color: AppColors.black,
                              size: 30,
                            ),
                          ),
                          const Text(
                            "Create Account ",
                            style: AppTextStyle.titleTextStyle,
                          )
                        ],
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.85,
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ReusableTextField(
                                width: 327,
                                height: 60,
                                controller: controller.nameController,
                                isPasswordType: false,
                                keyboardType: TextInputType.name,
                                text: 'username',
                                validator: controller.requiredValidator,
                              ),
                              ReusableTextField(
                                width: 327,
                                height: 60,
                                controller: controller.emailController,
                                isPasswordType: false,
                                keyboardType: TextInputType.emailAddress,
                                text: 'email',
                                validator: controller.requiredValidator,
                              ),
                              SizedBox(
                                  width: 327.w,
                                  height: 60.h,
                                  child: TextFormField(
                                    controller: controller.passwordController,
                                    obscureText:
                                        controller.isPressed ? false : true,
                                    validator: controller.requiredValidator,
                                    keyboardType: TextInputType.visiblePassword,
                                    cursorColor: Colors.black,
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.9)),
                                    decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: AppColors.black, width: 1.0),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      hintText: "Password",
                                      hintStyle: const TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w400),
                                      suffixIcon: IconButton(
                                          icon: Icon(controller.isPressed
                                              ? Icons.visibility_off
                                              : Icons.visibility),
                                          color: Colors.black,
                                          onPressed: () {
                                            controller.isPressed =
                                                !controller.isPressed;
                                            controller.update();
                                          }),
                                      labelStyle: TextStyle(
                                          color:
                                              AppColors.camel.withOpacity(0.9)),
                                      filled: true,
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.never,
                                      fillColor: Colors.white.withOpacity(0.3),
                                    ),
                                  )),
                              SizedBox(
                                  width: 327.w,
                                  height: 60.h,
                                  child: TextFormField(
                                    controller:
                                        controller.confirmPasswordController,
                                    obscureText: controller.isPressed_confirm
                                        ? false
                                        : true,
                                    validator: controller
                                        .requiredConfiemPasswordValidator,
                                    keyboardType: TextInputType.visiblePassword,
                                    cursorColor: Colors.black,
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.9)),
                                    decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: AppColors.black, width: 1.0),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      hintText: "Confirm Password",
                                      hintStyle: const TextStyle(
                                          color: AppColors.grey,
                                          fontWeight: FontWeight.w400),
                                      suffixIcon: IconButton(
                                          icon: Icon(
                                              controller.isPressed_confirm
                                                  ? Icons.visibility_off
                                                  : Icons.visibility),
                                          color: Colors.black,
                                          onPressed: () {
                                            controller.isPressed_confirm =
                                                !controller.isPressed_confirm;
                                            controller.update();
                                          }),
                                      filled: true,
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.never,
                                      fillColor: AppColors.white,
                                    ),
                                  )),
                              Row(
                                children: [
                                  Checkbox(
                                      activeColor: AppColors.black,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                      value: controller.isChecked,
                                      onChanged: (value) {
                                        controller.oncheck();
                                        controller.update();
                                      }),
                                  RichText(
                                    text: const TextSpan(
                                        text: 'I agree to the ',
                                        style: AppTextStyle.subtitleTextStyle,
                                        children: [
                                          TextSpan(
                                            text: 'terms and conditions ',
                                            style: AppTextStyle
                                                .subtitleBoldTextStyle,
                                          )
                                        ]),
                                  ),
                                ],
                              ),
                              MyButton(
                                  text: "Sign up",
                                  onClick: () {
                                    if (controller.formKey.currentState !=
                                            null &&
                                        controller.formKey.currentState!
                                            .validate()) {
                                      controller.SignUp();
                                    }
                                  }),
                              if (controller.loading == false) ...[],
                            ]),
                      ),
                    ],
                  ),
                ),
              );
            }));
  }
}
