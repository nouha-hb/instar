import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:instar/core/style/colors.dart';
import 'package:instar/core/style/text_style.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:instar/domain/entities/cart.dart';
import 'package:instar/domain/entities/product.dart';
import 'package:instar/presentation/UI/screens/products/product_description.dart';
import 'package:instar/presentation/UI/screens/splash_screen/splash_screen.dart';

import '../../../core/constant/api_const.dart';
import '../../../di.dart';
import '../../../domain/usecases/cart_usecases/update_cart_usecase.dart';
import '../../state_managment/controllers/main_page_controller.dart';
import '../../state_managment/controllers/product_desc_controller.dart';

class ShoppingComponent extends StatelessWidget {
  final Product product;

  const ShoppingComponent({super.key, required this.product});

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
                      builder: (context) => ProductDesc(product: product),
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
                    motion: const BehindMotion(),
                    children: [
                      SlidableAction(
                          borderRadius: BorderRadius.circular(15.r),
                          backgroundColor: AppColors.primary,
                          icon: Icons.delete,
                          label: "Delete",
                          onPressed: (context) async {
                           controller.update();

                            SplashScreen.cart.sales
                                .remove(product.id);
                            controller.shoppingproductsId
                                .remove(product.id);
                            ProductDescController.total -= product.price;
                            ProductDescController.addToCartItems--;
                           controller.update();

                            Cart cart = Cart(
                                id: SplashScreen.wishList!.id,
                                userId: SplashScreen.wishList!.userId,
                                sales: SplashScreen.wishList!.productsId);
                            await UpdateCartUsecase(sl()).call(cart: cart);
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
                                    "${ApiConst.files}/${product.image}"),
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
                                    product.name,
                                    style: AppTextStyle.elementNameTextStyle13,
                                  ),
                                  Text(
                                    product.category,
                                    style:
                                        AppTextStyle.smallLightLabelTextStyle,
                                  ),
                                  Text(
                                    ((product.price) * controller.quantity)
                                        .toString(),
                                    style: AppTextStyle.blueLabelTextStyle,
                                  ),
                                ],
                              )
                            ],
                          )),
                      Container(
                        width: 60.w,
                        height: 25.h,
                        decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(5.r)),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                controller.quantity++;
                              },
                              child: SizedBox(
                                height: 25.h,
                                width: 20.w,
                                child: Center(
                                    child: Icon(
                                  Icons.add,
                                  size: 16.sp,
                                  color: AppColors.white,
                                )),
                              ),
                            ),
                            InkWell(
                              child: SizedBox(
                                height: 25.h,
                                width: 20.w,
                                child: Center(
                                    child: Text(
                                  controller.quantity.toString(),
                                  style: const TextStyle(color: AppColors.white),
                                )),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                if (controller.quantity > 1) {
                                  controller.quantity--;
                                }
                              },
                              child: SizedBox(
                                height: 25.h,
                                width: 20.w,
                                child: Center(
                                    child: Icon(Icons.remove,
                                        size: 16.sp, color: AppColors.white)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
