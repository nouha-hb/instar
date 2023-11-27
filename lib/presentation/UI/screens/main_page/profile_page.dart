import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instar/di.dart';
import 'package:instar/domain/usecases/authentication_usecases/logout_usecase.dart';
import 'package:instar/presentation/UI/screens/paiement/detail_paiement.dart';
import 'package:instar/presentation/UI/screens/settings/settings.dart';
import 'package:instar/presentation/UI/screens/splash_screen/splash_screen.dart';
import 'package:instar/presentation/UI/widgets/profile_button_component.dart';

import '../../../../core/style/colors.dart';
import '../../../../core/style/text_style.dart';
import '../my_profile/profile_address.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      SizedBox(
        height: 10.h,
      ),

      // Container(
      //   width: 117,
      //   height: 117.h,
      //   decoration: BoxDecoration(
      //       shape: BoxShape.circle,
      //       border: Border.all(color: AppColors.primary)),
      // ),
      InkWell(
          onTap: () {},
          child: const ProfileButton(icon: Icons.wallet, text: "Mes achats")),
      SizedBox(
        height: 10.h,
      ),
      InkWell(
     onTap: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (_) => ProfileAddress()));
                },
        child: ProfileButton(icon: Icons.location_on, text: "Mon adresse")),
      SizedBox(
        height: 10.h,
      ),

      InkWell(
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const PaiementDetail())),
        child: const ProfileButton(icon: Icons.payment, text: "Mode de paiement")),
      SizedBox(
        height: 10.h,
      ),

      InkWell(
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const Settings(),)),
        child: const ProfileButton(icon: Icons.settings, text: "Paramétres", )),
      SizedBox(
        height: 10.h,
      ),

      InkWell(
        onTap: () async {
          final res = await LogoutUsecase(sl()).call();
          res.fold(
              (l) => null,
              (r) => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => const SplashScreen(),)));
        },
        child: Container(
          width: 325.w,
          height: 60.h,
          decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(13.r)),
          child: Padding(
            padding: EdgeInsets.all(8.0.r),
            child: Row(
              children: [
                Container(
                  width: 40.h,
                  height: 40.h,
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(color: AppColors.primary)),
                  child: Center(
                      child: Icon(
                    Icons.logout_rounded,
                    size: 15.sp,
                    color: AppColors.primary,
                  )),
                ),
                SizedBox(
                  width: 20.w,
                ),
                Text(
                  "Déconnexion",
                  style: AppTextStyle.primaryButtonTextStyle,
                ),
              ],
            ),
          ),
        ),
      ),
    ]));
  }
}
