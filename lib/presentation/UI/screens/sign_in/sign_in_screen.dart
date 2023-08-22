import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_social_button/flutter_social_button.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:instar/core/style/colors.dart';
import 'package:instar/core/style/text_style.dart';
import 'package:instar/domain/usecases/authentication_usecases/facebook_login_usecase.dart';
import 'package:instar/domain/usecases/authentication_usecases/google_login_usecase.dart';
import 'package:instar/domain/usecases/authentication_usecases/login_usecase.dart';
import 'package:instar/presentation/UI/screens/main_page/main_page.dart';
import 'package:instar/presentation/UI/screens/settings/language_settings.dart';

import 'package:instar/presentation/UI/screens/sign_up/sign_up_screen.dart';
import 'package:instar/presentation/UI/widgets/custom_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../di.dart';
import '../../../../domain/usecases/authentication_usecases/login_usecase.dart';
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
            controller.context = context;
            return SingleChildScrollView(
              reverse: false,
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
                            icon: const Icon(
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
                        AppLocalizations.of(context)!.login,
                        style: AppTextStyle.titleTextStyle,
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      ReusableTextField(
                        width: 326,
                        height: 40,
                        controller: controller.usernameController,
                        keyboardType: TextInputType.emailAddress,
                        text: AppLocalizations.of(context)!.email,
                        validator: controller.requiredEmailValidator,
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
                            validator: controller.requiredPasswordValidator,
                            keyboardType: TextInputType.visiblePassword,
                            cursorColor: Colors.black,
                            style:
                                TextStyle(color: Colors.black.withOpacity(0.9)),
                            decoration: InputDecoration(
                              enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: AppColors.grey),
                              ),
                              focusedBorder: const UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: AppColors.primary),
                              ),
                              hintText: AppLocalizations.of(context)!.password,
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
                          text: AppLocalizations.of(context)!.connect,
                          onClick: () async {
                            controller.signIn(context);
                          }),
                      

                      SizedBox(
                        height: 24.h,
                      ),
                      RichText(
                        text: TextSpan(
                            style: AppTextStyle.darkLabelTextStyle,
                            children: [
                              TextSpan(
                                text: AppLocalizations.of(context)!
                                    .forgot_password,
                                style: AppTextStyle.darkLabelTextStyle,
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ForgetPassword(),
                                      )),
                              )
                            ]),
                      ),
                      SizedBox(
                        height: 60.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FlutterSocialButton(
                            onTap: () {},
                            mini: true,
                            buttonType: ButtonType.facebook,
                          ),
                          SizedBox(
                            width: 20.w,
                          ),
                          FlutterSocialButton(
                            onTap: () async {
                              final res = await GoogleLoginUsecase(sl()).call();
                              res.fold(
                                  (l) => print('google left'),
                                  (r) => Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (_) => MainPage())));
                            },
                            mini: true,
                            buttonType: ButtonType.google,
                          ),
                        ],
                      ),
                      //SecondaryButton(
                      //     text: AppLocalizations.of(context)!
                      //         .continue_with_facebook
                      //         .toUpperCase(),
                      //     onClick: () {}),
                      // SizedBox(
                      //   height: 24.h,
                      // ),
                      // SecondaryButton(
                      //     text: AppLocalizations.of(context)!
                      //         .continue_with_google
                      //         .toUpperCase(),
                      //     onClick: () {}),
                      SizedBox(
                        height: 24.h,
                      ),
                      RichText(
                        softWrap: true,
                        textAlign: TextAlign.center,
                        text: TextSpan(children: [
                          TextSpan(
                              text:
                                  "${AppLocalizations.of(context)!.dont_have_account}\n",
                              style: AppTextStyle.darkLabelTextStyle,
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => Navigator.of(context)
                                    .pushReplacement(MaterialPageRoute(
                                        builder: (_) => ForgetPassword()))),
                          TextSpan(
                            text: AppLocalizations.of(context)!.register,
                            style: AppTextStyle.blueLabelTextStyle,
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => Navigator.of(context)
                                  .pushReplacement(MaterialPageRoute(
                                      builder: (_) => SignUp())),
                          )
                        ]),
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
