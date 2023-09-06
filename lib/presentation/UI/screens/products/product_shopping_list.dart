import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instar/core/style/assets.dart';
import 'package:instar/di.dart';
import 'package:instar/domain/entities/paiement.dart';
import 'package:instar/domain/entities/product.dart';
import 'package:instar/domain/usecases/product_usecases/get_one_product_usecase.dart';
import 'package:instar/presentation/UI/screens/paiement/detail_paiement.dart';
import 'package:instar/presentation/UI/widgets/custom_button.dart';
import 'package:instar/presentation/UI/widgets/shopping_list_component.dart';

import '../../../../core/style/colors.dart';
import '../../../../core/style/text_style.dart';
import '../splash_screen/splash_screen.dart';

class ShoppingListPage extends StatelessWidget {
  const ShoppingListPage({super.key});

  @override
  Widget build(BuildContext context) {
    late Product product;
    return Scaffold(
      appBar: AppBar(
                elevation: 0,
                backgroundColor: AppColors.white,
                foregroundColor: AppColors.black,
                title: Text(
                  "Panier",
                  style: AppTextStyle.elementNameTextStyle,
                ),
                centerTitle: true,
              ),
        body: Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
                height: 600.h,
                width: 300.w,
                child: ListView.builder(
                  itemCount: SplashScreen.cart.productsId.length,
                  itemBuilder: (context, index) {
                    print("productss carttt " +
                        SplashScreen.cart.productsId.toString());

                    return FutureBuilder(
                      future: GetOneProductsUsecase(sl())
                          .call(SplashScreen.cart.productsId[index]),
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
    ));
  }
}
