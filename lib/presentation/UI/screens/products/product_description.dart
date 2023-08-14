import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:instar/core/style/assets.dart';
import 'package:instar/core/style/colors.dart';
import 'package:instar/core/style/text_style.dart';
import 'package:instar/presentation/UI/screens/main_page/shopping_cart.dart';
import 'package:instar/presentation/UI/widgets/custom_button.dart';

import '../../../state_managment/controllers/product_list_controller.dart';

class ProductDesc extends StatelessWidget {
  const ProductDesc({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ProductListController>(
          init: ProductListController(),
          initState: (_) {},
          builder: (controller) {
            return Padding(
              padding: EdgeInsets.all(18.0.r),
              child: Stack(
                children: [
                  Positioned(
                      bottom: 20.h,
                      child:
                          PrimaryButton(text: "Add to cart", onClick: () {})),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () => Get.back(),
                            icon: Icon(
                              Icons.arrow_back_ios,
                              color: AppColors.darkGrey,
                              size: 30.sp,
                            ),
                          ),
                          Text(
                            "Détails produit",
                            style: AppTextStyle.elementNameTextStyle,
                          ),
                          IconButton(
                            onPressed: () => Get.to(ShoppingList()),
                            icon: Icon(
                              Icons.shopping_cart_outlined,
                              color: AppColors.black,
                              size: 30.sp,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Container(
                        height: 330.h,
                        decoration: BoxDecoration(
                            color: AppColors.lightgrey,
                            borderRadius: BorderRadius.circular(16),
                            image: DecorationImage(
                                image: AssetImage(
                                  Assets.product,
                                ),
                                fit: BoxFit.fill)),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            width: 60.w,
                            height: 25.h,
                            decoration: BoxDecoration(
                                color: AppColors.lightgrey,
                                borderRadius: BorderRadius.circular(5.r)),
                            child: Positioned(
                              bottom:20.h,
                              child: Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      // setState(() {
                                      //   quantity++;
                                      // });
                                    },
                                    child: Container(
                                      color: AppColors.primary,
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
                                        "1",
                                        // quantity.toString(),
                                        style:
                                            TextStyle(color: AppColors.black),
                                      )),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      // if (quantity > 1) {
                                      //   setState(() {
                                      //     quantity--;
                                      //}
                                      // );
                                      // }
                                    },
                                    child: Container(
                                      color: AppColors.primary,
                                      height: 25.h,
                                      width: 20.w,
                                      child: Center(
                                          child: Icon(Icons.remove,
                                              size: 16.sp,
                                              color: AppColors.white)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(controller.products[0].name.toString(),
                              style: AppTextStyle.producDescTitiletTextStyle),
                          Text(controller.products[0].price.toString(),
                              style: AppTextStyle.blueLabelTextStyle),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Meuble S&B",
                            style: AppTextStyle.lightLabelTextStyle,
                          ),
                          Row(
                            children: [
                              IconButton(
                                constraints: BoxConstraints(maxWidth: 20.w),
                                onPressed: () {
                                  controller.onTapStar1();
                                },
                                icon: Icon(
                                  Icons.star,
                                  color: controller.isPressed1
                                      ? AppColors.grey
                                      : AppColors.primary,
                                  size: 20.sp,
                                ),
                              ),
                              IconButton(
                                constraints: BoxConstraints(maxWidth: 20.w),
                                onPressed: () {
                                  controller.onTapStar2();
                                },
                                icon: Icon(
                                  Icons.star,
                                  color: controller.isPressed2
                                      ? AppColors.grey
                                      : AppColors.primary,
                                  size: 20.sp,
                                ),
                              ),
                              IconButton(
                                constraints: BoxConstraints(maxWidth: 20.w),
                                onPressed: () {
                                  controller.onTapStar3();
                                },
                                icon: Icon(
                                  Icons.star,
                                  color: controller.isPressed3
                                      ? AppColors.grey
                                      : AppColors.primary,
                                  size: 20.sp,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      Text(
                        "Couleurs",
                        style: AppTextStyle.producDescTitiletTextStyle,
                      ),
                      Row(
                        children: [
                          Container(
                            width: 20.w,
                            height: 20.h,
                            decoration: BoxDecoration(
                                color: Colors.pink[200],
                                shape: BoxShape.circle),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Container(
                            width: 20.w,
                            height: 20.h,
                            decoration: BoxDecoration(
                                color: Colors.orange[200],
                                shape: BoxShape.circle),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Container(
                            width: 20.w,
                            height: 20.h,
                            decoration: BoxDecoration(
                                color: Colors.blue[200],
                                shape: BoxShape.circle),
                          )
                        ],
                      ),

                      Text(
                        "Description",
                        style: AppTextStyle.producDescTitiletTextStyle,
                      ),
                      Text(controller.products[0].description.toString(),
                          style: AppTextStyle.darkLabelTextStyle),
                      // Text(controller.products[0].fournisseur.toString(),
                      //   style: AppTextStyle.darkLabelTextStyle),

                      SizedBox(
                        height: 20.h,
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
    );
  }
}