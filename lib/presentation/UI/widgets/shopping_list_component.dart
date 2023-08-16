import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instar/core/style/assets.dart';
import 'package:instar/core/style/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instar/core/style/text_style.dart';

class ShoppingComponent extends StatefulWidget {
  final String image_path;
  final String product_name;
  final String brand_name;
  final String price;

  const ShoppingComponent(
      {super.key,
      required this.image_path,
      required this.product_name,
      required this.brand_name,
      required this.price});

  @override
  State<ShoppingComponent> createState() => _ShoppingComponentState();
}

class _ShoppingComponentState extends State<ShoppingComponent> {
  @override
  Widget build(BuildContext context) {
    //bool isPressed = true;
    return InkWell(
      onTap: () {
        setState(() {
       //   isPressed = true;
        });
      },
      child: Container(
        width: 330.w,
        height: 100.h,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 15.r),
        ], color: AppColors.primary, borderRadius: BorderRadius.circular(15.r)),
        child: Row(
          children: [
            Container(
                width: 270.w,
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
                        child: Image.asset(Assets.product)),
                    SizedBox(
                      width: 20.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          widget.product_name,
                          style: AppTextStyle.elementNameTextStyle,
                        ),
                        Text(
                          widget.brand_name,
                          style: AppTextStyle.smallLightLabelTextStyle,
                        ),
                        Text(
                          widget.price,
                          style: AppTextStyle.blueLabelTextStyle,
                        ),
                      ],
                    )
                  ],
                )),
            Container(
                child: Padding(
              padding: EdgeInsets.only(left: 15.0.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: 25.w,
                      height: 25.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.r),
                        color: AppColors.white,
                      ),
                      child: Icon(Icons.edit),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: 25.w,
                      height: 25.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.r),
                        color: AppColors.white,
                      ),
                      child: Icon(Icons.delete),
                    ),
                  ),
                ],
              ),
            )
                //       : Container(
                //           width: 100.w,
                //           height: 100.h,
                //           color: AppColors.white,
                //           child: Container(
                //             width: 60.w,
                //             height: 25.h,
                //             decoration: BoxDecoration(
                //                 color: AppColors.primary,
                //                 borderRadius: BorderRadius.circular(5.r)),
                //             child: Row(
                //               children: [
                //                 InkWell(
                //                   onTap: () {},
                //                   child: SizedBox(
                //                     height: 25.h,
                //                     width: 20.w,
                //                     child: Center(
                //                         child: Icon(
                //                       Icons.add,
                //                       size: 16.sp,
                //                       color: AppColors.white,
                //                     )),
                //                   ),
                //                 ),
                //                 InkWell(
                //                   child: SizedBox(
                //                     height: 25.h,
                //                     width: 20.w,
                //                     child: Center(
                //                         child: Text(
                //                       "1",
                //                       style: TextStyle(color: AppColors.white),
                //                     )),
                //                   ),
                //                 ),
                //                 InkWell(
                //                   onTap: () {},
                //                   child: SizedBox(
                //                     height: 25.h,
                //                     width: 20.w,
                //                     child: Center(
                //                         child: Icon(Icons.remove,
                //                             size: 16.sp, color: AppColors.white)),
                //                   ),
                //                 ),
                //               ],
                //             ),
                //           ),
                //         ),
                ),
          ],
        ),
      ),
    );
  }
}
