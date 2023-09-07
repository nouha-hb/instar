import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:instar/core/style/assets.dart';
import 'package:instar/core/style/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instar/core/style/text_style.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:instar/di.dart';
import 'package:instar/domain/entities/product.dart';
import 'package:instar/domain/usecases/widhlist_usecases/update_wishlist_usecase.dart';
import 'package:instar/presentation/UI/screens/products/product_description.dart';
import 'package:instar/presentation/UI/screens/splash_screen/splash_screen.dart';

import '../../../core/constant/api_const.dart';
import '../../../domain/entities/wishlist.dart';
import '../../state_managment/controllers/main_page_controller.dart';

class FavoriteComponent extends StatelessWidget {
  final Product product;

  const FavoriteComponent({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
        init: MainController(),
        initState: (_) {},
        builder: (controller) {
          return Padding(
            padding: EdgeInsets.all(18.0.r),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDesc(product: this.product),
                    ));
              },
              child: Container(
                width: 400.w,
                height: 100.h,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black38,
                          spreadRadius: 0,
                          blurRadius: 15.r),
                    ],
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(15.r)),
                child: Slidable(
                  endActionPane: ActionPane(
                    motion: BehindMotion(),
                    children: [
                      SlidableAction(
                          borderRadius: BorderRadius.circular(15.r),
                          backgroundColor: AppColors.primary,
                          icon: Icons.delete,
                          label: "Delete",
                          onPressed: (context) async{
                            SplashScreen.wishList!.productsId
                                .remove(this.product.id);
                           controller.update();

                            controller.favoriteproductsId
                                .remove(this.product.id);
                            WishList wishlist = WishList(
                                id: SplashScreen.wishList!.id,
                                userId: SplashScreen.wishList!.userId,
                                productsId: SplashScreen.wishList!.productsId);
                           await  UpdateWishListUsecase(sl())
                                .call(wishlist: wishlist);

                            controller.update();
                          }),
                    ],
                  ),
                  child: Row(
                    children: [
                      Container(
                          width: 200.w,
                          height: 100.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.r),
                              color: AppColors.white
                              //color: AppColors.grey,
                              ),
                          child: Row(
                            children: [
                              Container(
                                height: 100.h,
                                width: 100.w,
                                decoration: BoxDecoration(
                                    color: AppColors.lightgrey,
                                    borderRadius: BorderRadius.circular(15.r)),
                                child: Image.network(
                                    "${ApiConst.files}/${this.product.image}"),
                              ),
                              SizedBox(
                                width: 20.w,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    this.product.name,
                                    style: AppTextStyle.elementNameTextStyle13,
                                  ),
                                  Text(
                                    this.product.category,
                                    style:
                                        AppTextStyle.smallLightLabelTextStyle,
                                  ),
                                  Text(
                                    ((this.product.price)).toString(),
                                    style: AppTextStyle.blueLabelTextStyle,
                                  ),
                                ],
                              )
                            ],
                          )),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
