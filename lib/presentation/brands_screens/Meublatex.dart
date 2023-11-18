import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instar/domain/entities/product.dart';
import 'package:instar/presentation/UI/screens/main_page/main_page.dart';
import 'package:instar/presentation/UI/widgets/product_component.dart';

import '../../../../core/style/colors.dart';
import '../../../../core/style/text_style.dart';
import '../../di.dart';
import '../../domain/usecases/product_usecases/get_all_products_usecase.dart';

class Meublatex extends StatefulWidget {
  const Meublatex({super.key});

  @override
  State<Meublatex> createState() => _MeublatexState();
}

class _MeublatexState extends State<Meublatex> {
 
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const MainPage(),)), icon: const Icon(Icons.arrow_back_ios)),
      elevation: 0,
      backgroundColor: AppColors.white,
      foregroundColor: AppColors.black,
      title: Text(
        "Meublatex",
        style: AppTextStyle.elementNameTextStyle16,
      ),
    ),
    body: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 10.h,
          ),
          SizedBox(
              width: 350.w,
              child: const SearchBar(
                hintText: 'Recherche ...',
                leading: Icon(Icons.search),
              )),
          SizedBox(
            height: 10.h,
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
                        style: AppTextStyle.elementNameTextStyle16,
                      ),
                      RichText(
                        text: TextSpan(
                            style: AppTextStyle.darkLabelTextStyle,
                            children: [
                              TextSpan(
                                  text: 'Voir tout',
                                  style: AppTextStyle.blueLabelTextStyle,
                                  recognizer: TapGestureRecognizer()
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
                        style: AppTextStyle.elementNameTextStyle16,
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
                  // Container(
                  //   width: 326.w,
                  //   height: 210.h,
                  //   decoration:
                  //       BoxDecoration(borderRadius: BorderRadius.circular(15.r)),
                  //   child: Image.asset(Assets.arrivee),
                  // ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Text(
                  //       "Nouvel arrivage",
                  //       style: AppTextStyle.elementNameTextStyle16,
                  //     ),
                  //     RichText(
                  //       text: TextSpan(
                  //           style: AppTextStyle.darkLabelTextStyle,
                  //           children: [
                  //             TextSpan(
                  //                 text: 'Voir tout',
                  //                 style: AppTextStyle.blueLabelTextStyle,
                  //                 recognizer: TapGestureRecognizer()
                  //                 //..onTap = () => Get.to(ForgetPassword()),
                  //                 )
                  //           ]),
                  //     ),
                  //   ],
                  // ),
                  // Container(
                  //   constraints: BoxConstraints(
                  //       //below mentioned sizes for reference only
                  //       minWidth: 100.0.w,
                  //       maxWidth: 325.0.w,
                  //       minHeight: 200.0.h,
                  //       maxHeight: 300.0.h),
                  //   child: ListView.builder(
                  //     scrollDirection: Axis.vertical,
                  //     itemCount: NvlArriveeProducts.length,
                  //     itemBuilder: (BuildContext ctx, index) {
                  //       return Padding(
                  //         padding: EdgeInsets.all(8.0.r),
                  //         child: NouvelArrivage(
                  //           product: NvlArriveeProducts[index],
                  //         ),
                  //       );
                  //     },
                  //   ),
                  // ),
                ],
              ),
            ),
          )
        ],),
    ),);
  }
}
