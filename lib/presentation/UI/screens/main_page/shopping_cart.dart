import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:instar/core/style/colors.dart';
import 'package:instar/core/style/text_style.dart';
import 'package:instar/di.dart';
import 'package:instar/domain/entities/product.dart';
import 'package:instar/domain/entities/sales.dart';
import 'package:instar/domain/usecases/product_usecases/get_one_product_usecase.dart';
import 'package:instar/presentation/UI/screens/paiement/detail_paiement.dart';
import 'package:instar/presentation/UI/widgets/custom_button.dart';
import 'package:instar/presentation/UI/widgets/shopping_list_component.dart';
import 'package:instar/presentation/state_managment/controllers/cart_controller.dart';
import 'package:instar/presentation/state_managment/controllers/product_desc_controller.dart';
import '../splash_screen/splash_screen.dart';

class ShoppingList extends StatelessWidget {
  const ShoppingList({super.key});

  @override
  Widget build(BuildContext context) {
    late Product product;
    return GetBuilder<CartController>(
        init: CartController(),
        initState: (_) {},
        builder: (controller) {
          return Container(
            color: AppColors.background,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                        height: 550.h,
                        width: double.infinity,
                        child: ListView.builder(
                          itemCount:  SplashScreen.cart.sales.length,
                          itemBuilder: (context, index) {
                            return FutureBuilder(
                              future: GetOneProductsUsecase(sl())
                                  .call( (SplashScreen.cart.sales[index] as Sales).productId),
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
                                  return  Center(
                                      child: index <1 ?const CircularProgressIndicator():Container());
                                }
                                return ShoppingComponent(product: product,sale :SplashScreen.cart.sales.firstWhere((element) =>(element as Sales).productId == product.id));
                              },
                            );
              
                            // Center(child: Text(SplashScreen.cart.productsId[index].toString())
                          },
                        )),
                    // SizedBox(
                    //   height: 10.h,
                    // ),
                    // Text(
                    //   "Totale : ${ProductDescController.total}DT",
                    //   style: AppTextStyle.darkLabelTextStyle,
                    // ),
                    SizedBox(
                      height: 10.h,
                    ),
                    PrimaryButton(
                      text: "Acheter",
                      onClick: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const PaiementDetail(),
                            ));
                      },
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}