import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:instar/core/style/colors.dart';
import 'package:instar/core/style/text_style.dart';
import 'package:instar/presentation/UI/screens/sign_in/sign_in_screen.dart';
import 'package:instar/presentation/UI/widgets/custom_button.dart';
import 'package:instar/presentation/UI/widgets/term&conditions_dialog.dart';

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
              controller.context = context;
              return Form(
                key: controller.formKey,
                child: SingleChildScrollView(
                  reverse: false,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.arrow_back,
                              color: AppColors.darkGrey,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 39.h,
                      ),
                      Text(
                        "Créer un compte ",
                        style: AppTextStyle.titleTextStyle,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ReusableTextField(
                              width: 326,
                              height: 60,
                              controller: controller.firstnameController,
                              keyboardType: TextInputType.name,
                              text: 'Nom',
                              validator: controller.requiredValidator,
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            ReusableTextField(
                              width: 326,
                              height: 40,
                              controller: controller.lastnameController,
                              keyboardType: TextInputType.name,
                              text: 'Prénom',
                              validator: controller.requiredValidator,
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            ReusableTextField(
                              width: 326,
                              height: 40,
                              controller: controller.emailController,
                              keyboardType: TextInputType.emailAddress,
                              text: 'Email',
                              validator: controller.requiredEmailValidator,
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            ReusableTextField(
                              width: 326,
                              height: 40,
                              controller: controller.phoneController,
                              keyboardType: TextInputType.phone,
                              text: 'Téléphone',
                              validator: controller.requiredPhoneValidator,
                            ),
                            SizedBox(
                              height: 20.h,
                            ),

                            SizedBox(
                                width: 326.w,
                                height: 40.h,
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
                                    enabledBorder: const UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: AppColors.grey),
                                    ),
                                    focusedBorder: const UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: AppColors.primary),
                                    ),
                                    hintText: "Mot de passe ",
                                    hintStyle: AppTextStyle.lightLabelTextStyle,
                                    suffixIcon: IconButton(
                                        icon: Icon(controller.isPressed
                                            ? Icons.visibility_off
                                            : Icons.visibility),
                                        color: AppColors.primary,
                                        onPressed: () {
                                          controller.isPressed =
                                              !controller.isPressed;
                                          controller.update();
                                        }),
                                    labelStyle:
                                        AppTextStyle.lightLabelTextStyle,
                                    filled: true,
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.never,
                                    fillColor: Colors.white.withOpacity(0.3),
                                  ),
                                )),
                            // SizedBox(
                            //     width: 327.w,
                            //     height: 60.h,
                            //     child: TextFormField(
                            //       controller:
                            //           controller.confirmPasswordController,
                            //       obscureText: controller.isPressed_confirm
                            //           ? false
                            //           : true,
                            //       validator: controller
                            //           .requiredConfiemPasswordValidator,
                            //       keyboardType: TextInputType.visiblePassword,
                            //       cursorColor: Colors.black,
                            //       style: TextStyle(
                            //           color: Colors.black.withOpacity(0.9)),
                            //       decoration: InputDecoration(
                            //         focusedBorder: OutlineInputBorder(
                            //           borderSide: const BorderSide(
                            //               color: AppColors.black, width: 1.0),
                            //           borderRadius: BorderRadius.circular(8),
                            //         ),
                            //         border: OutlineInputBorder(
                            //           borderRadius: BorderRadius.circular(8),
                            //         ),
                            //         hintText: "Confirm Password",
                            //         hintStyle: const TextStyle(
                            //             color: AppColors.grey,
                            //             fontWeight: FontWeight.w400),
                            //         suffixIcon: IconButton(
                            //             icon: Icon(
                            //                 controller.isPressed_confirm
                            //                     ? Icons.visibility_off
                            //                     : Icons.visibility),
                            //             color: Colors.black,
                            //             onPressed: () {
                            //               controller.isPressed_confirm =
                            //                   !controller.isPressed_confirm;
                            //               controller.update();
                            //             }),
                            //         filled: true,
                            //         floatingLabelBehavior:
                            //             FloatingLabelBehavior.never,
                            //         fillColor: AppColors.white,
                            //       ),
                            //     )),
                            // Row(
                            //   children: [
                            //     Checkbox(
                            //         activeColor: AppColors.black,
                            //         shape: RoundedRectangleBorder(
                            //             borderRadius:
                            //                 BorderRadius.circular(4)),
                            //         value: controller.isChecked,
                            //         onChanged: (value) {
                            //           controller.oncheck();
                            //           controller.update();
                            //         }),
                            //     RichText(
                            //       text: TextSpan(
                            //           text: 'I agree to the ',
                            //           style: AppTextStyle.subtitleTextStyle,
                            //           children: [
                            //             TextSpan(
                            //               recognizer: TapGestureRecognizer()
                            //                 ..onTap = () {
                            //                   showDialog(
                            //                       context: context,
                            //                       builder: (_) =>
                            //                           const TermAndConditionsDialog());
                            //                 },
                            //               text: 'terms and conditions ',
                            //               style: AppTextStyle
                            //                   .subtitleBoldTextStyle,
                            //             )
                            //           ]),
                            //     ),
                            //   ],
                            // ),
                            SizedBox(
                              height: 60.h,
                            ),
                            PrimaryButton(
                                text: "Inscription",
                                onClick: () {
                                  if (controller.formKey.currentState != null &&
                                      controller.formKey.currentState!
                                          .validate()) {
                                    showDialog<String>(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          AlertDialog(
                                        title: const Text('Success'),
                                        content: const Text(
                                            'Your account is created :'),
                                        actions: <Widget>[
                                         
                                          TextButton(
                                            onPressed: () =>
                                                Navigator.push(context, MaterialPageRoute(builder: (context) => SignIn(),)),
                                            child: const Text('OK'),
                                          ),
                                        ],
                                      ),
                                    );
                                    controller.SignUp();
                                  }
                                }),
                            SizedBox(
                              height: 20.h,
                            ),
                            RichText(
                              softWrap: true,
                              textAlign: TextAlign.center,
                              text: TextSpan(children: [
                                TextSpan(
                                  text: "vous avez  déja un compte ?\n",
                                  style: AppTextStyle.darkLabelTextStyle,
                                ),
                                TextSpan(
                                  text: 'Connexion',
                                  style: AppTextStyle.blueLabelTextStyle,
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () => Navigator.of(context)
                                        .pushReplacement(MaterialPageRoute(
                                            builder: (_) => SignIn())),
                                )
                              ]),
                            ),
                            if (controller.loading == false) ...[],
                          ]),
                    ],
                  ),
                ),
              );
            }));
  }
}
