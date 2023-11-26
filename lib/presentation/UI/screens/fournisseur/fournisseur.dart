import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:instar/core/style/assets.dart';
import 'package:instar/core/style/text_style.dart';
import 'package:instar/domain/entities/fournisseur.dart';
import 'package:instar/domain/entities/product.dart';
import 'package:instar/presentation/UI/screens/main_page/main_page.dart';
import 'package:instar/presentation/UI/widgets/product_component.dart';
import '../../../../core/style/colors.dart';
import '../../../../di.dart';
import '../../../../domain/entities/product.dart';
import '../../../../domain/usecases/product_usecases/get_all_products_usecase.dart';
import '../../../state_managment/controllers/fournisseur_controller.dart';


class FournisseurPage extends StatelessWidget {
  final Fournisseur fournisseur;

  const FournisseurPage({
    required this.fournisseur,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FournisseurController>(
        init: FournisseurController(),
        initState: (_) {},
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MainPage(),
                      )),
                  icon: Icon(Icons.arrow_back_ios)),
              elevation: 0,
              backgroundColor: AppColors.white,
              foregroundColor: AppColors.black,
              title: Text(
                fournisseur.name,
                style: AppTextStyle.elementNameTextStyle16,
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    width: 326.w,
                    height: 210.h,
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(15.r)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          fournisseur.name,
                          style: AppTextStyle.elementNameTextStyle16,
                        ),
                        Text(
                          fournisseur.address,
                          style: AppTextStyle.elementNameTextStyle16,
                        ),
                        Text(
                          fournisseur.phone.toString(),
                          style: AppTextStyle.elementNameTextStyle16,
                        ),
                      ],
                    ),
                  ),
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
                                "Products",
                                style: AppTextStyle.elementNameTextStyle16,
                              ),
                              RichText(
                                text: TextSpan(
                                    style: AppTextStyle.darkLabelTextStyle,
                                    children: [
                                      TextSpan(
                                          text: 'Voir tout',
                                          style:
                                              AppTextStyle.blueLabelTextStyle,
                                          recognizer: TapGestureRecognizer())
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
                                              itemBuilder: (_, index) =>
                                                  ProductComponent(
                                                    product: productList[index],
                                                  )),
                                        );
                                },
                              )),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
