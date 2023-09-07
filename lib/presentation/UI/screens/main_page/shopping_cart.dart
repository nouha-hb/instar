import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:instar/core/style/assets.dart';
import 'package:instar/core/style/text_style.dart';
import 'package:instar/di.dart';
import 'package:instar/domain/entities/paiement.dart';
import 'package:instar/domain/entities/product.dart';
import 'package:instar/domain/usecases/product_usecases/get_one_product_usecase.dart';
import 'package:instar/presentation/UI/screens/paiement/detail_paiement.dart';
import 'package:instar/presentation/UI/widgets/custom_button.dart';
import 'package:instar/presentation/UI/widgets/shopping_list_component.dart';
import 'package:instar/presentation/state_managment/controllers/product_desc_controller.dart';

import '../../../state_managment/controllers/main_page_controller.dart';
import '../splash_screen/splash_screen.dart';

class ShoppingList extends StatelessWidget {
  const ShoppingList({super.key});

  @override
  Widget build(BuildContext context) {
    late Product product;
    return GetBuilder<MainController>(
        init: MainController(),
        initState: (_) {},
        builder: (controller) {
          controller.update();
          return Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                      height: 560.h,
                      width: 300.w,
                      child: ListView.builder(
                        itemCount: controller.shoppingproductsId.length,
                        itemBuilder: (context, index) {
                          print("productss carttt " +
                              SplashScreen.cart.productsId.toString());

                          return FutureBuilder(
                            future: GetOneProductsUsecase(sl())
                                .call(controller.shoppingproductsId[index]),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                final res = snapshot.data;
                                print('data = $res');
                                res!.fold((l) {
                                  return null;
                                }, (r) {
                                  product = r;
                                });
                              } else if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              }
                              return ShoppingComponent(product: product);
                            },
                          );

                          // Center(child: Text(SplashScreen.cart.productsId[index].toString())
                        },
                      )),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    "Totale : " + ProductDescController.total.toString() + "DT",
                    style: AppTextStyle.darkLabelTextStyle,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  PrimaryButton(
                    text: "Acheter",
                    onClick: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PaiementDetail(),
                          ));
                    },
                  )
                ],
              ),
            ),
          );
        });
  }
}
