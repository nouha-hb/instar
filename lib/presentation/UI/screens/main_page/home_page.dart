import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:instar/core/style/colors.dart';
import 'package:instar/core/style/text_style.dart';
import 'package:instar/domain/entities/Promotion.dart';
import 'package:instar/domain/entities/product.dart';
import 'package:instar/domain/usecases/promotion_usecases/get_all_promotions_usecase.dart';
import 'package:instar/presentation/UI/screens/main_page/categories_page.dart';
import 'package:instar/presentation/UI/widgets/categroy_component.dart';

import '../../../../core/style/assets.dart';
import '../../../../di.dart';
import '../../../../domain/usecases/product_usecases/get_all_products_usecase.dart';
import '../../widgets/product_component.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    List brand_names = [
      "Meublatex",
      "S&B",
      "xxxx",
       "Meublatex",
    ];
    List image_svg_names = [
      Assets.categorie_literie,
      Assets.categorie_enfants,
      Assets.categorie_cuisine,
      Assets.categorie_literie,

    ];
    List<Promotion> promotionList = [];

    return Column(
      children: [
          SizedBox(
          height: 20.h,
        ),
        FutureBuilder(
          future: GetAllPromotionsUsecase(sl()).call(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final res = snapshot.data;
              print('data = $res');
              res!.fold((l) {
                print("left promotionsssssssssssssssssssssssss");
                return null;
              }, (r) {
                promotionList = r;
                print('rightttttttt ' + promotionList.toString());
              });
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            return promotionList.isEmpty
                ? Text("no promotion")
                : Container(
                    width: 326.w,
                    height: 210.h,
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(15.r)),
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: promotionList.length,
                        itemBuilder: (_, index) =>
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 40.w,
                                ),
                                Text(promotionList[index].discount.toString()+"%", style: AppTextStyle.titleTextStyle,textAlign: TextAlign.center,),
                               Image.asset(promotionList[index].image),
                            


                              ],
                            )),
                  );
          },
        ),
        SizedBox(
          height: 20.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 10.r,
            ),
            RichText(
              textAlign: TextAlign.start,
              text: TextSpan(style: AppTextStyle.darkLabelTextStyle, children: [
                TextSpan(
                    text: 'Nos marques',
                    style: AppTextStyle.blueLabelTextStyle,
                    recognizer: TapGestureRecognizer()
                    //..onTap = () => Get.to(ForgetPassword()),
                    )
              ]),
            ),
          ],
        ),
        SizedBox(
          height: 20.h,
        ),
        Container(
          //width: MediaQuery.sizeOf(context).width,
          height: 120.h,
        
          decoration: BoxDecoration(
              color: AppColors.bgColor,
              borderRadius: BorderRadius.circular(15.r)),
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: brand_names.length,
              itemBuilder: (_, index) => Padding(
                padding:  EdgeInsets.all(8.0.r),
                child: CategoryComponeny(
                  width: 100.w,
                  height: 90.h,
                    image_path: image_svg_names[index],
                    category_name: brand_names[index]),
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
                            : Center(
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: productList.length,
                                  itemBuilder: (_, index) => ProductComponent(
                                        product: productList[index],
                                      )),
                            );
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
