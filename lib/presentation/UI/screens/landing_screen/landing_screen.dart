import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:instar/core/style/assets.dart';
import 'package:instar/presentation/UI/screens/sign_in/sign_in_screen.dart';
import 'package:instar/presentation/UI/screens/sign_up/sign_up_screen.dart';
import 'package:instar/presentation/UI/widgets/custom_button.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375.w,
      height: 812.h,
      decoration: BoxDecoration(
        image:
            DecorationImage(image: AssetImage(Assets.home), fit: BoxFit.cover),
      ),
      child: Center(
        child: Column(
          children: [
            SizedBox(
              height: 176.h,
            ),
            Container(
              width: 198.w,
              height: 198.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(Assets.logo), fit: BoxFit.cover),
              ),
            ),
            SizedBox(
              height: 60.h,
            ),
            SecondaryButton(
                text: "Login",
                onClick: () {
                  Get.to(SignIn());
                }),
            SizedBox(
              height: 24.h,
            ),
            PrimaryButton(
                text: "Sign up",
                onClick: () {
                  Get.to(SignUp());
                })
          ],
        ),
      ),
    );
  }
}
