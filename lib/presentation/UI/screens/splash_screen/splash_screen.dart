import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:instar/core/style/assets.dart';
import 'package:instar/domain/entities/user.dart';
import 'package:instar/domain/entities/wishlist.dart';
import 'package:instar/domain/usecases/authentication_usecases/auto_login_usecase.dart';
import 'package:instar/domain/usecases/authentication_usecases/get_user_usecase.dart';
import 'package:instar/domain/usecases/widhlist_usecases/get_wishlist_usecase.dart';
import 'package:instar/presentation/UI/screens/main_page/main_page.dart';
import 'package:instar/presentation/UI/screens/settings/language_settings.dart';
import 'package:instar/presentation/UI/screens/sign_in/sign_in_screen.dart';
import 'package:instar/presentation/UI/screens/sign_up/sign_up_screen.dart';
import 'package:instar/presentation/UI/widgets/custom_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../di.dart';
import '../../../../domain/entities/token.dart';

class SplashScreen extends StatefulWidget {
  static late Token userToken;
  static late User currentUser;
  static late WishList wishList;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  //bool signedIn = false;
  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  Future<void> init() async {
    bool res = true;
    final autologiVarReturn = await AutoLoginUsecase(sl()).call();
    print(' autologin');
    autologiVarReturn.fold((l) {
      print(' autologin left');

      return res = false;
    }, (r) async {
      print(' autologin right');
      SplashScreen.userToken = r;
      final user = await GetUserUsecase(sl()).call(SplashScreen.userToken.userId);
      print(' getuser');
      user.fold((l) {
        print(' getuser  left');

        return res = false;
      }, (r) {
        print(' getuser  right');

        SplashScreen.currentUser = r;
      });
      final wishlist = await GetWishListUsecase(sl())
          .call(userId: SplashScreen.userToken.userId);
      print(' get wishlist');

      wishlist.fold((l) {
        print(' wishlist  left');

        return res = false;
      }, (r) {
        print(' wishlist  right');

        SplashScreen.wishList = r;
      });
    });
    print(res.toString()+"res");
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => res ? const MainPage() : const SignIn()));
    });
  }

  Widget build(BuildContext context) {
    return Container(
      width: 375.w,
      height: 812.h,
      decoration: const BoxDecoration(
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
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(Assets.logo), fit: BoxFit.cover),
              ),
            ),
            SizedBox(
              height: 60.h,
            ),
            // SecondaryButton(
            //     text: AppLocalizations.of(context)!.login,
            //     onClick: () {
            //       Navigator.of(context)
            //           .push(MaterialPageRoute(builder: (_) => SignIn()));
            //     }),
            // SizedBox(
            //   height: 24.h,
            // ),
            // PrimaryButton(
            //     text: AppLocalizations.of(context)!.signUp,
            //     onClick: () {
            //      Navigator.push(context, MaterialPageRoute(builder:(context) => SignUp(),));
            //     })
          ],
        ),
      ),
    );
  }
}
