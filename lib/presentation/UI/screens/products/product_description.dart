import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:instar/core/style/colors.dart';
import 'package:instar/core/style/text_style.dart';
import 'package:instar/presentation/UI/screens/shopping_cart/shopping_cart_list.dart';
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
              child: Column(
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
                          color: AppColors.black,
                          size: 30.sp,
                        ),
                      ),
                      IconButton(
                        onPressed: () => Get.to(ShoppingCart()),
                        icon: Icon(
                          Icons.shopping_cart,
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
                      color: AppColors.grey,
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(controller.products[0].name.toString(),
                      style: AppTextStyle.darkLabelTextStyle),
                  Text(controller.products[0].description.toString(),
                      style: AppTextStyle.darkLabelTextStyle),
                  Text(
                    'Price : ',
                    style: TextStyle(color: AppColors.black),
                  ),
                  Text(controller.products[0].price.toString(),
                      style: AppTextStyle.darkLabelTextStyle),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    children: [
                      Text("Quantity : ",
                          style: AppTextStyle.darkLabelTextStyle),
                    ],
                  ),
                  Align(
                      alignment: Alignment.bottomRight,
                      child: PrimaryButton(text: "Add to cart", onClick: () {})),
                ],
              ),
            );
          }),
    );
  }
}
