import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:instar/core/style/colors.dart';
import 'package:instar/core/style/text_style.dart';

import '../../widgets/product_component.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
    children: [
      Container(
        width: 326.w,
        height: 210.h,
        decoration: BoxDecoration(
          color: AppColors.lightgrey,
          borderRadius: BorderRadius.circular(15.r)
        ),
        child: Center(child: Text("Promotions", style: AppTextStyle.titleTextStyle,),),
      ), 
      Padding(
        padding:  EdgeInsets.all(10.0.r),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Top vente", style: AppTextStyle.elementNameTextStyle,),
                   RichText(
                    text: TextSpan(
                        style: AppTextStyle.darkLabelTextStyle,
                        children: [
                          TextSpan(
                            text: 'Voir tout',
                            style: AppTextStyle.blueLabelTextStyle,
                            recognizer: TapGestureRecognizer()
                              //..onTap = () => Get.to(ForgetPassword()),
                          )
                        ]),
                  ),
                ],
              ),
              SizedBox(
                width: 326.w,
                height: 200.h,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [
        ProductComponent(brand_product: 'Sm&B', product_name: 'Armoire de toilette', product_price: '200 dt', product_ref: 'ef321',),
        ProductComponent(brand_product: 'Sm&B', product_name: 'Armoire de toilette', product_price: '200 dt', product_ref: 'ef321',),
        ProductComponent(brand_product: 'Sm&B', product_name: 'Armoire de toilette', product_price: '200 dt', product_ref: 'ef321',),
        ProductComponent(brand_product: 'Sm&B', product_name: 'Armoire de toilette', product_price: '200 dt', product_ref: 'ef321',),
        ProductComponent(brand_product: 'Sm&B', product_name: 'Armoire de toilette', product_price: '200 dt', product_ref: 'ef321',),
        
                  
                ],),
              ),
                  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Top tendance", style: AppTextStyle.elementNameTextStyle,),
                   RichText(
                    text: TextSpan(
                        style: AppTextStyle.darkLabelTextStyle,
                        children: [
                          TextSpan(
                            text: 'Voir tout',
                            style: AppTextStyle.blueLabelTextStyle,
                            recognizer: TapGestureRecognizer()
                              //..onTap = () => Get.to(ForgetPassword()),
                          )
                        ]),
                  ),
                ],
              ),
              SizedBox(
                width: 326.w,
                height: 200.h,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [
        ProductComponent(brand_product: 'Sm&B', product_name: 'Armoire de toilette', product_price: '200 dt', product_ref: 'ef321',),
        ProductComponent(brand_product: 'Sm&B', product_name: 'Armoire de toilette', product_price: '200 dt', product_ref: 'ef321',),
        ProductComponent(brand_product: 'Sm&B', product_name: 'Armoire de toilette', product_price: '200 dt', product_ref: 'ef321',),
        ProductComponent(brand_product: 'Sm&B', product_name: 'Armoire de toilette', product_price: '200 dt', product_ref: 'ef321',),
        ProductComponent(brand_product: 'Sm&B', product_name: 'Armoire de toilette', product_price: '200 dt', product_ref: 'ef321',),
        
                  
                ],),
              ),
            ],
          ),
        ),
      )
    ],
    );
  }
}