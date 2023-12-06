import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:instar/di.dart';
import 'package:instar/domain/entities/product.dart';

import '../../../../core/style/colors.dart';
import '../../../../core/style/text_style.dart';
import '../../../../domain/usecases/product_usecases/get_all_products_usecase.dart';
import '../../../state_managment/controllers/main_page_controller.dart';
import '../../widgets/product_component.dart';

class VenteProduct extends StatelessWidget {
  const VenteProduct({super.key});

  @override
  Widget build(BuildContext context) {
    late Product product;
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.darkGrey,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Top vente",
          style: AppTextStyle.elementNameTextStyle,
        ),
        centerTitle: true,
      ),
      body: GetBuilder<MainController>(
          init: MainController(),
          initState: (_) {},
          builder: (controller) {
            return SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    FutureBuilder(
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
                            : SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.8,
                                width: MediaQuery.of(context).size.width,
                                child: GridView.builder(
                                  itemCount: productList.length,
                                  itemBuilder: (_, index) => ProductComponent(
                                    product: productList[index],
                                  ),
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    childAspectRatio: 0.6,
                                    crossAxisCount:
                                        2, // number of items in each row
                                    mainAxisSpacing:
                                        2.0.h, // spacing between rows
                                    crossAxisSpacing:
                                        2.0.w, // spacing between columns
                                  ),
                                ),
                              );
                      },
                    )
                  ]),
            );
          }

          // Center(child: Text(SplashScreen.cart.productsId[index].toString())

          ),
    );
  }
}
