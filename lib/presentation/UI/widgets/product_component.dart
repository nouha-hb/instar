import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:instar/core/style/assets.dart';
import 'package:instar/core/style/colors.dart';
import 'package:instar/core/style/text_style.dart';
import 'package:instar/presentation/UI/screens/products/product_description.dart';

class ProductComponent extends StatefulWidget {
  final String product_name;
  final String product_ref;
  final String brand_product;
  final String product_price;
  const ProductComponent(
      {super.key,
      required this.product_name,
      required this.product_ref,
      required this.brand_product,
      required this.product_price});

  @override
  State<ProductComponent> createState() => _ProductComponentState();
}

class _ProductComponentState extends State<ProductComponent> {
  bool favorite = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(6.0.r),
      child: InkWell(
        onTap: () =>  Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProductDesc()
                                  )),
        child: Container(
          width: 155.w,
          height: 220.h,
          decoration: BoxDecoration(
              // boxShadow: [
              //   BoxShadow(
              //       color: AppColors.grey, spreadRadius: 0, blurRadius: 5.r),
              // ],
              color: AppColors.white,
              borderRadius: BorderRadius.circular(15.r)),
          child: Stack(
            children: [
              Positioned(
                  left: 125.w,
                  top: 10.h,
                  child: IconButton(
                   // constraints: BoxConstraints(maxWidth: 10.w),
                     onPressed: () {
                    setState(() {
                      favorite = !favorite;
                    });
                  },
                    icon:favorite? Icon(
                      Icons.favorite,
                      color: AppColors.primary,
                    ):
                    Icon(
                      Icons.favorite_outline,
                      color: AppColors.primary,
                    ),
                  )),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 130.w,
                    height: 130.h,
                    child: Image.asset(Assets.product),
                  ),
                  Text(
                    widget.product_name,
                    style: AppTextStyle.elementNameTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        widget.product_ref,
                        style: AppTextStyle.lightLabelTextStyle,
                      ),
                      Text(
                        widget.product_price,
                        style: AppTextStyle.blueLabelTextStyle,
                      )
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
