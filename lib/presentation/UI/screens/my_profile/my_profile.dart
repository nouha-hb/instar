import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:instar/core/style/colors.dart';

import '../../widgets/profile_button_component.dart';
import 'edit_profile.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.white,
          title: Text("Profile"),
          centerTitle: true,
          foregroundColor: AppColors.black,
        ),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              width: 117.w,
              height: 117.h,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.primary)),
              child: Center(child: FlutterLogo()),
            ),
            SizedBox(
              height: 10.h,
            ),
            InkWell(
                onTap: () {},
                child: ProfileButton(icon: Icons.wallet, text: "Mes achats")),
            SizedBox(
              height: 10.h,
            ),
            ProfileButton(icon: Icons.location_on, text: "Mon adresse"),
            SizedBox(
              height: 10.h,
            ),
            ProfileButton(icon: Icons.payment, text: "Mode de paiement"),
            SizedBox(
              height: 10.h,
            ),
            InkWell(
                onTap: () {
                  Get.to(EditProfile());
                },
                child: ProfileButton(icon: Icons.settings, text: "Paramétres")),
            SizedBox(
              height: 10.h,
            ),
            ProfileButton(icon: Icons.logout_rounded, text: "Se déconnecter"),
          ]),
        ));
  }
}
