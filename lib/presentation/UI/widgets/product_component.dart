import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:instar/core/style/assets.dart';
import 'package:instar/core/style/colors.dart';
import 'package:instar/core/style/text_style.dart';
import 'package:instar/presentation/UI/screens/products/product_description.dart';

class ProductComponent extends StatelessWidget {
  final String product_name;
  final String product_ref;
  final String brand_product;
  final String product_price;
  const ProductComponent({super.key, required this.product_name, required this.product_ref, required this.brand_product, required this.product_price});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(6.0.r),
      child: InkWell(
        onTap: () => Get.to(ProductDesc()),
        child: Container(
          width: 155.w,
          height: 220.h,
          decoration: BoxDecoration(
                // boxShadow: [
                //   BoxShadow(
                //       color: AppColors.grey, spreadRadius: 0, blurRadius: 5.r),
                // ],
              color: AppColors.white, borderRadius: BorderRadius.circular(15.r)),
          child: Stack(
            children: [
              Positioned(
                left: 125.w,
                top: 10.h,
                  child: ClipOval(
                child: Icon(Icons.favorite ,color: AppColors.primary,),
              )),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 130.w,
                    height: 130.h,
                    child: Image.asset(Assets.product),
                  ),
                  Text(product_name, style: AppTextStyle.elementNameTextStyle,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(product_ref, style: AppTextStyle.lightLabelTextStyle,),
                    Text(product_price,  style: AppTextStyle.blueLabelTextStyle,)
      
                  ],
                ),
          
          
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
