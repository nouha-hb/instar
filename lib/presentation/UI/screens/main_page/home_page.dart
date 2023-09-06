import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:instar/core/style/colors.dart';
import 'package:instar/core/style/text_style.dart';
import 'package:instar/domain/entities/Promotion.dart';
import 'package:instar/domain/entities/product.dart';
import 'package:instar/domain/usecases/promotion_usecases/get_all_promotions_usecase.dart';

import '../../../../di.dart';
import '../../../../domain/usecases/product_usecases/get_all_products_usecase.dart';
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
              borderRadius: BorderRadius.circular(15.r)),
          child: Center(
              child: FutureBuilder(
            future: GetAllPromotionsUsecase(sl()).call(),
            builder: (context, snapshot) {
              List<Promotion> promotionList = [];
              if (snapshot.hasData) {
                final res = snapshot.data;
                print('data = $res');
                res!.fold((l) {
                  return null;
                }, (r) {
                  promotionList = r;
                  print('rightttttttt ' + promotionList.toString());
                });
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              return promotionList.isEmpty
                  ? Container()
                  : ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: promotionList.length,
                      itemBuilder: (_, index) =>
                          Text(promotionList[index].discount.toString()));
            },
          )),
        ),
        Padding(
          padding: EdgeInsets.all(10.0.r),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Top vente",
                      style: AppTextStyle.elementNameTextStyle,
                    ),
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
                Container(
                    constraints: BoxConstraints(
                        //below mentioned sizes for reference only
                        minWidth: 100.0.w,
                        maxWidth: 325.0.w,
                        minHeight: 200.0.h,
                        maxHeight: 300.0.h),
                    child: FutureBuilder(
                      future: GetAllProductsUsecase(sl()).call(),
                      builder: (context, snapshot) {
                        List<Product> productList = [];
                        if (snapshot.hasData) {
                          final res = snapshot.data;
                          print('data = $res');
                          res!.fold((l) {
                            return null;
                          }, (r) {
                            productList = r;
                          });
                        } else if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                        return productList.isEmpty
                            ? Container()
                            : ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: productList.length,
                                itemBuilder: (_, index) => ProductComponent(
                                      product: productList[index],
                                    ));
                      },
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Top tendance",
                      style: AppTextStyle.elementNameTextStyle,
                    ),
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
                Container(
                    constraints: BoxConstraints(
                        //below mentioned sizes for reference only
                        minWidth: 100.0.w,
                        maxWidth: 325.0.w,
                        minHeight: 200.0.h,
                        maxHeight: 300.0.h),
                    child: FutureBuilder(
                      future: GetAllProductsUsecase(sl()).call(),
                      builder: (context, snapshot) {
                        List<Product> productList = [];
                        if (snapshot.hasData) {
                          final res = snapshot.data;
                          print('data = $res');
                          res!.fold((l) {
                            return null;
                          }, (r) {
                            productList = r;
                          });
                        } else if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                        return productList.isEmpty
                            ? Container()
                            : ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: productList.length,
                                itemBuilder: (_, index) => ProductComponent(
                                      product: productList[index],
                                    ));
                      },
                    )),
              ],
            ),
          ),
        )
      ],
    );
  }
}
