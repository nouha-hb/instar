import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:instar/core/style/assets.dart';
import 'package:instar/core/style/colors.dart';
import 'package:instar/core/style/text_style.dart';
import 'package:instar/domain/entities/Product3D.dart';
import 'package:instar/domain/entities/product.dart';
import 'package:instar/presentation/UI/screens/main_page/shopping_cart.dart';
import 'package:instar/presentation/UI/widgets/custom_button.dart';
import 'package:badges/badges.dart' as badges;
import 'package:model_viewer_plus/model_viewer_plus.dart';
import '../../../../core/constant/api_const.dart';
import '../../../state_managment/controllers/product_list_controller.dart';

class ProductDesc extends StatefulWidget {
  //late Product3D currentTexture;
  final Product product;
  ProductDesc({super.key, required this.product});

  @override
  State<ProductDesc> createState() => _ProductDescState();
}

class _ProductDescState extends State<ProductDesc> {
  @override
  void initState() {
    currentTexture = widget.product.image3D[0];
    super.initState();
  }

  late Product3D currentTexture;
  Key _refreshKey = UniqueKey();

  int quantity = 1;
  int addToCartItems = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ProductListController>(
          init: ProductListController(),
          initState: (_) {},
          builder: (controller) {
            return Padding(
              padding: EdgeInsets.all(18.0.r),
              child: Stack(
                children: [
                  Positioned(
                      bottom: 20.h,
                      child: PrimaryButton(
                          text: "Add to cart",
                          onClick: () {
                            setState(() {
                              addToCartItems++;
                            });
                          })),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: Icon(
                              Icons.arrow_back_ios,
                              color: AppColors.darkGrey,
                              size: 30.sp,
                            ),
                          ),
                          Text(
                            "Détails produit",
                            style: AppTextStyle.elementNameTextStyle,
                          ),
                          badges.Badge(
                            badgeContent: Text(addToCartItems.toString()),
                            badgeAnimation:
                                const badges.BadgeAnimation.rotation(
                              animationDuration: Duration(seconds: 1),
                              colorChangeAnimationDuration:
                                  Duration(seconds: 1),
                              loopAnimation: false,
                              curve: Curves.fastOutSlowIn,
                              colorChangeAnimationCurve: Curves.easeInCubic,
                            ),
                            badgeStyle: badges.BadgeStyle(
                              shape: badges.BadgeShape.circle,
                              badgeColor: AppColors.primary,
                              padding: EdgeInsets.all(5.r),
                              borderRadius: BorderRadius.circular(4.r),
                            ),
                            child: IconButton(
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ShoppingList())),
                              icon: Icon(
                                Icons.shopping_cart_outlined,
                                color: AppColors.black,
                                size: 30.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      SizedBox(
                        height: 300,
                        child: ModelViewer(
                          key: _refreshKey,
                          backgroundColor:
                              const Color.fromARGB(0xFF, 0xEE, 0xEE, 0xEE),
                          src: 'assets/images/${currentTexture.model3D}',
                          alt: 'A 3D model of an astronaut',
                          ar: true,
                          autoRotate: true,
                          // iosSrc: 'https://modelviewer.dev/shared-assets/models/Astronaut.usdz',
                          disableZoom: true,
                        ),
                      ),
                      /* Container(
                        height: 330.h,
                        decoration: BoxDecoration(
                          color: AppColors.lightgrey,
                          borderRadius: BorderRadius.circular(16),
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                                "${ApiConst.files}/${widget.product.image}"),
                          ),
                        ),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            width: 60.w,
                            height: 25.h,
                            decoration: BoxDecoration(
                                color: AppColors.lightgrey,
                                borderRadius: BorderRadius.circular(5.r)),
                            child: Positioned(
                              bottom: 20.h,
                              child: Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        quantity++;
                                      });
                                    },
                                    child: Container(
                                      color: AppColors.primary,
                                      height: 25.h,
                                      width: 20.w,
                                      child: Center(
                                          child: Icon(
                                        Icons.add,
                                        size: 16.sp,
                                        color: AppColors.white,
                                      )),
                                    ),
                                  ),
                                  InkWell(
                                    child: SizedBox(
                                      height: 25.h,
                                      width: 20.w,
                                      child: Center(
                                          child: Text(
                                        quantity.toString(),
                                        style:
                                            TextStyle(color: AppColors.black),
                                      )),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      if (quantity > 1) {
                                        setState(() {
                                          quantity--;
                                        });
                                      }
                                    },
                                    child: Container(
                                      color: AppColors.primary,
                                      height: 25.h,
                                      width: 20.w,
                                      child: Center(
                                          child: Icon(Icons.remove,
                                              size: 16.sp,
                                              color: AppColors.white)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),*/
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(widget.product.name.toString(),
                              style: AppTextStyle.producDescTitiletTextStyle),
                          Text((widget.product.price * quantity).toString(),
                              style: AppTextStyle.blueLabelTextStyle),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Meuble S&B",
                            style: AppTextStyle.lightLabelTextStyle,
                          ),
                          Row(
                            children: [
                              IconButton(
                                constraints: BoxConstraints(maxWidth: 20.w),
                                onPressed: () {
                                  controller.onTapStar1();
                                },
                                icon: Icon(
                                  Icons.star,
                                  color: controller.isPressed1
                                      ? AppColors.primary
                                      : AppColors.grey,
                                  size: 20.sp,
                                ),
                              ),
                              IconButton(
                                constraints: BoxConstraints(maxWidth: 20.w),
                                onPressed: () {
                                  controller.onTapStar2();
                                },
                                icon: Icon(
                                  Icons.star,
                                  color: controller.isPressed2
                                      ? AppColors.primary
                                      : AppColors.grey,
                                  size: 20.sp,
                                ),
                              ),
                              IconButton(
                                constraints: BoxConstraints(maxWidth: 20.w),
                                onPressed: () {
                                  controller.onTapStar3();
                                },
                                icon: Icon(
                                  Icons.star,
                                  color: controller.isPressed3
                                      ? AppColors.primary
                                      : AppColors.grey,
                                  size: 20.sp,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      Text(
                        "Couleurs",
                        style: AppTextStyle.producDescTitiletTextStyle,
                      ),
                      Row(
                        children: widget.product.image3D.map((e) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                currentTexture = e;
                                _refreshKey = UniqueKey();
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: CircleAvatar(
                                  radius: e.id == currentTexture.id ? 15 : 12,
                                  backgroundImage: NetworkImage(
                                      '${ApiConst.files}/${e.texture}')),
                            ),
                          );
                        }).toList(),
                      ),

                      Text(
                        "Description",
                        style: AppTextStyle.producDescTitiletTextStyle,
                      ),
                      Text(widget.product.description,
                          style: AppTextStyle.darkLabelTextStyle),
                      // Text(controller.products[0].fournisseur.toString(),
                      //   style: AppTextStyle.darkLabelTextStyle),

                      SizedBox(
                        height: 20.h,
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
    );
  }
}
