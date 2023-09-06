import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:instar/core/style/assets.dart';
import 'package:instar/core/style/colors.dart';
import 'package:instar/domain/entities/user.dart';
import 'package:instar/domain/entities/wishlist.dart';
import 'package:instar/domain/entities/cart.dart';

import 'package:instar/domain/usecases/authentication_usecases/auto_login_usecase.dart';
import 'package:instar/domain/usecases/authentication_usecases/get_user_usecase.dart';
import 'package:instar/domain/usecases/widhlist_usecases/get_wishlist_usecase.dart';
import 'package:instar/presentation/UI/screens/landing_screen/landing_screen.dart';
import 'package:instar/presentation/UI/screens/main_page/main_page.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../di.dart';
import '../../../../domain/entities/token.dart';
import '../../../../domain/usecases/cart_usecases/get_cart_usecase.dart';

class SplashScreen extends StatefulWidget {
  static late Token userToken;
  static late User currentUser;
  static late WishList wishList;
  static late Cart cart;

  static Future<void> init(BuildContext context, int duration) async {
    bool res = true;
    final autologiVarReturn = await AutoLoginUsecase(sl()).call();
    print(' autologin');
    autologiVarReturn.fold((l) {
      print(' autologin left');

      return res = false;
    }, (r) async {
      print(' autologin right $r');
      SplashScreen.userToken = r;
      final user =
          await GetUserUsecase(sl()).call(SplashScreen.userToken.userId);
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
        final cart = await GetCartUsecase(sl())
          .call(userId: SplashScreen.userToken.userId);
      print(' get cart ');

      cart.fold((l) {
        print(' cart  left');

        return res = false;
      }, (r) {
        print(' cart  right');

        SplashScreen.cart = r;
      });
    });
    print(res.toString() + "res");
    Future.delayed(Duration(seconds: duration), () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  res ? const MainPage() : const LandingPage()));
    });
  }

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  //bool signedIn = false;
  @override
  void initState() {
    SplashScreen.init(context, 3);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375.w,
      height: 812.h,
      color: AppColors.white,
      child: Center(
        child: Container(
          width: 198.w,
          height: 198.h,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(Assets.indar), fit: BoxFit.fitHeight),
          ),
        ),
      ),
    );
  }
}
