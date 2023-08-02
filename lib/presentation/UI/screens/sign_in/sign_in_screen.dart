import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:instar/core/style/colors.dart';
import 'package:instar/core/style/text_style.dart';
import 'package:instar/presentation/UI/screens/sign_up/sign_up_screen.dart';
import 'package:instar/presentation/UI/widgets/custom_button.dart';
import 'package:flutter_social_button/flutter_social_button.dart';
import '../../../state_managment/controllers/sign_in_controller.dart';
import '../../widgets/custom_textform.dart';
import '../profile/profile_screen.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<SignInController>(
          init: SignInController(),
          initState: (_) {},
          builder: (controller) {
            return Center(
              child: SingleChildScrollView(
                child: Form(
                  key: controller.formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Login ",
                              style: AppTextStyle.titleTextStyle,
                            ),
                            SizedBox(
                              height: 40.h,
                            ),
                            ReusableTextField(
                              width: 327,
                              height: 60,
                              controller: controller.usernameController,
                              keyboardType: TextInputType.name,
                              text: 'username',
                              validator: controller.requiredValidator,
                            ),
                            SizedBox(
                              height: 8.h,
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
                          ],
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            //For facebook Button

                            FlutterSocialButton(
                              onTap: () {
                                controller.FacebookLogin();
                              },
                              buttonType: ButtonType
                                  .facebook, // Button type for different type buttons
                              mini: true,
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            //For google Button

                            FlutterSocialButton(
                              onTap: () {},
                              buttonType: ButtonType
                                  .google, // Button type for different type buttons
                              mini: true,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                         RichText(
                          text: TextSpan(
                            
                              style: AppTextStyle.subtitleTextStyle,
                              children: [
                                TextSpan(
                                  text: 'Forget password ?',
                                  style: AppTextStyle.subtitleBoldTextStyle,
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () => Get.to(SignUp()),
                                )
                              ]),
                        ),
                        SizedBox(height: 10.h,),
                         RichText(
                          text: TextSpan(
                              text: 'new User ? ',
                              style: AppTextStyle.subtitleTextStyle,
                              children: [
                                TextSpan(
                                  text: 'Sign up',
                                  style: AppTextStyle.subtitleBoldTextStyle,
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () => Get.to(SignUp()),
                                )
                              ]),
                        ),
                        
                        SizedBox(
                          height: 30.h,
                        ),
                        MyButton(
                            text: "Sign in ",
                            onClick: () {
                              controller.signIn();
                            }),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
