import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:instar/di.dart';
import 'package:instar/presentation/state_managment/controllers/main_page_controller.dart';
import 'package:instar/presentation/state_managment/controllers/product_details_controller.dart';
import 'package:instar/presentation/state_managment/controllers/wishlist_controller.dart';

import '../../../../domain/usecases/product_usecases/get_one_product_usecase.dart';
import '../../widgets/favorite_component.dart';
import '../splash_screen/splash_screen.dart';

class FavoriteList extends StatefulWidget {
   FavoriteList({
    super.key,
  });

  @override
  State<FavoriteList> createState() => _FavoriteListState();
}

class _FavoriteListState extends State<FavoriteList> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailsController>(
        init: ProductDetailsController(),
        builder: (controller) {
          return Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                        height: 600.h,
                        width: double.infinity,
                        child: ListView.builder(
                          itemCount: controller.wishList.productsId.length,
                          itemBuilder: (context, index) {
                           // print("productss wishListtt ${SplashScreen.wishList!.productsId}");
                            return FavoriteComponent(product: controller.wishList.productsId[index]);
                          },
                        )),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
