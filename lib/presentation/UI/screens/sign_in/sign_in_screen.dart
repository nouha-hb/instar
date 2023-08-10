import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:instar/core/style/colors.dart';
import 'package:instar/core/style/text_style.dart';
import 'package:instar/domain/entities/product.dart';
import 'package:instar/domain/usecases/authentication_usecases/google_login_usecase.dart';
import 'package:instar/domain/usecases/authentication_usecases/login_usecase.dart';
import 'package:instar/presentation/UI/screens/categoryprod.dart';
import 'package:instar/presentation/UI/screens/sign_up/sign_up_screen.dart';
import 'package:instar/presentation/UI/widgets/custom_button.dart';

import '../../../../di.dart';

import '../../../state_managment/controllers/sign_in_controller.dart';
import '../../widgets/custom_textform.dart';
import '../forget_password/forgetpassword.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<SignInController>(
          init: SignInController(),
          initState: (_) {},
          builder: (controller) {

            return SingleChildScrollView(
              reverse: true,
              child: Form(
                key: controller.formKey,
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                        "Login ",
                        style: AppTextStyle.titleTextStyle,
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      ReusableTextField(
                        width: 326,
                        height: 40,
                        controller: controller.usernameController,
                        keyboardType: TextInputType.name,
                        text: 'Email',
                        validator: controller.requiredValidator,
                      ),
                      SizedBox(
                        height: 20.h,
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
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.9)),
                            decoration: InputDecoration(
                              enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: AppColors.grey),
                              ),
                              focusedBorder:const  UnderlineInputBorder(
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
                              labelStyle: AppTextStyle.lightLabelTextStyle,
                              filled: true,
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              fillColor: Colors.white.withOpacity(0.3),
                            ),
                          )),
                           SizedBox(
                    height: 100.h,
                  ),
                     PrimaryButton(
                      text: "connexion",
                      onClick: () {
                        controller.signIn();
                      }),
                      
                     
                  SizedBox(
                    height: 24.h,
                  ),
                  RichText(
                    text: TextSpan(
                        style: AppTextStyle.darkLabelTextStyle,
                        children: [
                          TextSpan(
                            text: 'Mot de passe oublié?',
                            style: AppTextStyle.darkLabelTextStyle,
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => Get.to(ForgetPassword()),
                          )
                        ]),
                  ),
                     SizedBox(
                    height: 60.h,
                  ),
                  SecondaryButton(text: "CONTINUER AVEC FACEBOOK", onClick: (){}),
                     SizedBox(
                    height: 24.h,
                  ),
                  SecondaryButton(text: "CONTINUER AVEC Google", onClick: (){}),
                
                  
                  SizedBox(
                    height: 24.h,
                  ),
                  RichText(
softWrap: true,    
textAlign: TextAlign.center,                text: TextSpan(
                        children: [
                          
                           TextSpan(
                            text: "vous n'avez pas déja un compte ?\n" ,
                            style: AppTextStyle.darkLabelTextStyle,
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => Get.to(ForgetPassword()),
                          ),  TextSpan(
                
                            text: 'Inscrivez vous ?',
                                                  style: AppTextStyle.blueLabelTextStyle,
                                                
                
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => Get.to(SignUp()),
                          )]),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                    ],

                  ),
                ),
              ),
            );
          }),
    );
  }
}
