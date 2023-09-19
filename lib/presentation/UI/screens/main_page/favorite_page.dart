import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:instar/core/style/assets.dart';
import 'package:instar/core/style/colors.dart';
import 'package:instar/di.dart';
import 'package:instar/domain/usecases/widhlist_usecases/get_wishlist_usecase.dart';
import 'package:instar/presentation/UI/widgets/product_component.dart';
import 'package:instar/presentation/UI/widgets/shopping_list_component.dart';
import 'package:instar/presentation/state_managment/controllers/main_page_controller.dart';

import '../../../../domain/entities/product.dart';
import '../../../../domain/usecases/product_usecases/get_one_product_usecase.dart';
import '../../widgets/favorite_component.dart';
import '../splash_screen/splash_screen.dart';

class FavoriteList extends StatelessWidget {
  const FavoriteList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
        init: MainController(),
        initState: (_) {},
        builder: (controller) {
          return Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                      height: 600.h,
                      width: 300.w,
                      child: ListView.builder(
                        itemCount: controller.favoriteproductsId.length,
                        itemBuilder: (context, index) {
                          print("productss wishListtt " +
                              SplashScreen.wishList!.productsId.toString());
                          return FutureBuilder(
                            future: GetOneProductsUsecase(sl())
                                .call(SplashScreen.wishList.productsId[index]),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                final res = snapshot.data;
                                print('data = $res');
                                res!.fold((l) {
                                  return null;
                                }, (r) {
                                  return FavoriteComponent(product: r);
                                });
                              } else if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              }
                              return Container();
                            },
                          );
                        },
                      )),
                ],
              ),
            ),
          );
        });
  }
}
