import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:instar/di.dart';
import 'package:instar/domain/entities/subCategory.dart';
import 'package:instar/domain/usecases/subcategories_usecases/get_subcategory_usecase.dart';
import '../../../../core/style/assets.dart';
import '../../../../core/style/colors.dart';
import '../../../../core/style/text_style.dart';
import '../../../../domain/entities/product.dart';
import '../../../../domain/usecases/product_usecases/get_all_products_usecase.dart';
import '../../../../domain/usecases/product_usecases/get_products_by_category_usecase.dart';
import '../../../../domain/usecases/product_usecases/get_products_by_subcategory_usecase.dart';
import '../../../state_managment/controllers/main_page_controller.dart';
import '../../../state_managment/controllers/product_by_category_controller.dart';
import '../../widgets/categroy_component.dart';
import '../../widgets/product_component.dart';
import '../../widgets/subcategory_component.dart';

class ProductsByCategory extends StatelessWidget {
  final String category;
  const ProductsByCategory({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    List image_svg_names = [
      Assets.categorie_literie,
      Assets.categorie_enfants,
      Assets.categorie_cuisine,
      Assets.categorie_salon,
      Assets.categorie_salle_de_bain,
      Assets.categorie_decoration
    ];
    late Product product;
    List<SubCategory> subcategoryList = [];

    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: AppColors.darkGrey,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Products by " + this.category,
          style: AppTextStyle.elementNameTextStyle,
        ),
        centerTitle: true,
      ),
      body: GetBuilder<ProductByCategoryController>(
          init: ProductByCategoryController(),
          initState: (_) {},
          builder: (controller) {
            return SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    FutureBuilder(
                      future: GetAllSubCategoriesUsecase(sl()).call(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          final res = snapshot.data;

                          print('data  sucategories r= $res');
                          res!.fold((l) {
                            print("left subcategories");
                            return null;
                          }, (r) {
                            subcategoryList = r;
                            print('rightttttttt ' + subcategoryList.toString());
                          });
                        } else if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                        return subcategoryList.isEmpty
                            ? Text("no subcategory")
                            : Container(
                                //width: MediaQuery.sizeOf(context).width,
                                height: 120.h,

                                decoration: BoxDecoration(
                                    color: AppColors.bgColor,
                                    borderRadius: BorderRadius.circular(15.r)),
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: subcategoryList.length,
                                    itemBuilder: (_, index) => Padding(
                                          padding: EdgeInsets.all(8.0.r),
                                          child: InkWell(
                                            onTap: () {
                                              controller
                                                          .isPressedSubCategory =
                                                      true;
                                                  controller.subCategory =
                                                      subcategoryList[index]
                                                          .name;
                                                  controller.update();
                                            },
                                            child: SubCategoryComponeny(
                                                width: 100.w,
                                                height: 60.h,
                                            
                                                subcategory_name:
                                                    subcategoryList[index]
                                                        .name),
                                          ),
                                        )),
                              );
                      },
                    ),
                    controller.isPressedSubCategory
                        ? FutureBuilder(
                            future: GetProductsBySubCategoryUsecase(sl())
                                .call(this.category, controller.subCategory),
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
                                          MediaQuery.of(context).size.height *
                                              0.8,
                                      width: MediaQuery.of(context).size.width,
                                      child: GridView.builder(
                                        itemCount: productList.length,
                                        itemBuilder: (_, index) =>
                                            ProductComponent(
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
                        : FutureBuilder(
                            future: GetProductsByCategoryUsecase(sl())
                                .call(this.category),
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
                                          MediaQuery.of(context).size.height *
                                              0.8,
                                      width: MediaQuery.of(context).size.width,
                                      child: GridView.builder(
                                        itemCount: productList.length,
                                        itemBuilder: (_, index) =>
                                            ProductComponent(
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
