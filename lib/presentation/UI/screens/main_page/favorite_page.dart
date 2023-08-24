import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instar/core/style/assets.dart';
import 'package:instar/core/style/colors.dart';
import 'package:instar/di.dart';
import 'package:instar/domain/usecases/widhlist_usecases/get_wishlist_usecase.dart';
import 'package:instar/presentation/UI/widgets/product_component.dart';
import 'package:instar/presentation/UI/widgets/shopping_list_component.dart';

import '../splash_screen/splash_screen.dart';

class favoriteList extends StatelessWidget {
  const favoriteList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 500.h,
        width: 300.w,
        child: ListView.builder(
          itemCount: SplashScreen.wishList.productsId.length,
          itemBuilder: (context, index) {
            print("productssssssss"+SplashScreen.wishList.productsId.toString());
            return Center(child: Text(SplashScreen.wishList.productsId[index].toString()));
          },
        ));
  }
}
