import 'package:flutter/material.dart';
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
    

    return Center(
    child: FutureBuilder(
        future: GetWishListUsecase(sl())
            .call(userId: SplashScreen.userToken.userId),
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: AppColors.primary,
              ),
            );
          } else if (snapshot.hasData) {
            final res = snapshot.data;
            res!.fold((l) {
              return Center(child: Text(l.message.toString()));
              print("wishlist left");
            }, (r) {
              return ListView.builder(
                  itemCount: r.productsId.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ProductComponent(
                        product_name: "product_name",
                        product_ref: r.productsId.toString(),
                        brand_product: "brand_product",
                        product_price: "product_price");
                  });
              print("wishlist left");
            });
          }
          return Text(" no wish list");
        }));
  }
}
