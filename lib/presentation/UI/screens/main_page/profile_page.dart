import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:instar/presentation/UI/screens/main_page/shopping_cart.dart';
import 'package:instar/presentation/UI/widgets/profile_button_component.dart';

import '../../../../core/style/colors.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      Container(
        width: 117,
        height: 117.h,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.primary)),
      ),
      InkWell(
          onTap: () {},
          child: ProfileButton(icon: Icons.wallet, text: "Mes achats")),
      ProfileButton(icon: Icons.location_on, text: "Mon adresse"),
      ProfileButton(icon: Icons.payment, text: "Mode de paiement"),
      ProfileButton(icon: Icons.settings, text: "Paramétres"),
      ProfileButton(icon: Icons.logout_rounded, text: "Se déconnecter"),
    ]);
  }
}
