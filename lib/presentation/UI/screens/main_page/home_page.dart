import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instar/core/style/colors.dart';
import 'package:instar/core/style/text_style.dart';
import 'package:instar/domain/entities/promotion.dart';
import 'package:instar/domain/entities/product.dart';
import 'package:instar/domain/usecases/promotion_usecases/get_all_promotions_usecase.dart';
import 'package:instar/presentation/UI/screens/products/product_tendance_page.dart';
import 'package:instar/presentation/UI/screens/products/product_vente_page.dart';
import 'package:instar/presentation/UI/widgets/categroy_component.dart';

import '../../../../core/style/assets.dart';
import '../../../../di.dart';
import '../../../../domain/usecases/fournisseur_usecases/get_fournisseurs_usecase.dart';
import '../../../../domain/usecases/product_usecases/get_all_products_usecase.dart';
import '../../widgets/product_component.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    List imageSvgNames = [
      Assets.categorie_literie,
      Assets.categorie_enfants,
      Assets.categorie_cuisine,
    ];
    List<Promotion> promotionList = [];
    //List<Fournisseur> fournisseurList = [];
     List fournisseurList = ["Meublatex" , "S&B" , "xxx",];


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
                print('rightttttttt $promotionList');
              });
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            return promotionList.isEmpty
                ? const Text("no promotion")
                : Container(
                    width: 326.w,
                    height: 210.h,
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(15.r)),
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: promotionList.length,
                        itemBuilder: (_, index) => Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 40.w,
                                ),
                                Text(
                                  "${promotionList[index].discount}%",
                                  style: AppTextStyle.titleTextStyle,
                                  textAlign: TextAlign.center,
                                ),
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
        FutureBuilder(
          future: GetAllFournisseursUsecase(sl()).call(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final res = snapshot.data;

              print('data  fournisseurs r= $res');
              res!.fold((l) {
                print("left fournisseursssss");
                return null;
              }, (r) {
                fournisseurList = r;
                print('rightttttttt $fournisseurList');
              });
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            return fournisseurList.isEmpty
                ? const Text("no fournisseur")
                : Container(
                    //width: MediaQuery.sizeOf(context).width,
                    height: 120.h,

                    decoration: BoxDecoration(
                        color: AppColors.bgColor,
                        borderRadius: BorderRadius.circular(15.r)),
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: fournisseurList.length,
                        itemBuilder: (_, index) => Padding(
                              padding: EdgeInsets.all(8.0.r),
                              child: CategoryComponeny(
                                  width: 100.w,
                                  height: 90.h,
                                  image_path: imageSvgNames[index],
                                  category_name: fournisseurList[index].name),
                            )),
                  );
          },
        ),
        // Container(
        //   width: MediaQuery.sizeOf(context).width,
        //   height: 120.h,
        //   decoration: BoxDecoration(
        //       color: AppColors.bgColor,
        //       borderRadius: BorderRadius.circular(15.r)),
        //   child: ListView.builder(
        //       scrollDirection: Axis.horizontal,
        //       itemCount: fournisseurList.length,
        //       itemBuilder: (_, index) => Padding(
        //             padding: EdgeInsets.all(8.0.r),
        //             child: GestureDetector(
        //               onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) =>Meublatex() ,)),
        //               child: CategoryComponeny(
        //                   width: 100.w,
        //                   height: 90.h,
        //                   image_path: image_svg_names[index],
        //                   category_name: fournisseurList[index]),
        //             ),
        //           )),
        // ),
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
                                  ..onTap = () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const VenteProduct(),
                                      )))
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
                                  ..onTap = () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const Tendance(),
                                      )))
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