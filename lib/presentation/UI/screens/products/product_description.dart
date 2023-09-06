import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:instar/core/style/assets.dart';
import 'package:instar/core/style/colors.dart';
import 'package:instar/core/style/text_style.dart';
import 'package:instar/domain/entities/Product3D.dart';
import 'package:instar/domain/entities/product.dart';
import 'package:instar/presentation/UI/screens/main_page/shopping_cart.dart';
import 'package:instar/presentation/UI/widgets/comment.dart';
import 'package:instar/presentation/UI/widgets/custom_button.dart';
import 'package:badges/badges.dart' as badges;
import 'package:instar/presentation/state_managment/controllers/product_details_controller.dart';
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
    expandableController = ExpandableController();
    currentTexture = widget.product.image3D[0];
    super.initState();
  }

  @override
  void dispose() {
    expandableController.dispose();
    super.dispose();
  }

  late Product3D currentTexture;
  Key _refreshKey = UniqueKey();
  int stars = 0;
  bool expanded = false;
  int quantity = 1;
  int addToCartItems = 0;
  late ExpandableController expandableController;
  @override
  Widget build(BuildContext context) {
    print('product' + widget.product.toString());
    return GetBuilder<ProductDetailsController>(
      init: ProductDetailsController(),
      builder: (controller) => Scaffold(
        backgroundColor: AppColors.bgColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.bgColor,
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios,
              color: AppColors.darkGrey,
            ),
          ),
          title: Text(
            "Product details",
            style: AppTextStyle.elementNameTextStyle,
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 12.0.w, top: 4),
              child: badges.Badge(
                badgeContent: Text(
                  addToCartItems.toString(),
                  style: const TextStyle(color: Colors.white),
                ),
                badgeAnimation: const badges.BadgeAnimation.rotation(
                  animationDuration: Duration(seconds: 1),
                  colorChangeAnimationDuration: Duration(seconds: 1),
                  loopAnimation: false,
                  curve: Curves.fastOutSlowIn,
                  colorChangeAnimationCurve: Curves.easeInCubic,
                ),
                badgeStyle: const badges.BadgeStyle(
                  shape: badges.BadgeShape.circle,
                  badgeColor: AppColors.primary,
                ),
                child: IconButton(
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ShoppingList())),
                  icon: const Icon(
                    Icons.shopping_cart_outlined,
                    color: AppColors.black,
                    //size: 30.sp,
                  ),
                ),
              ),
            ),
          ],
        ),
        body: GetBuilder<ProductListController>(
            init: ProductListController(),
            initState: (_) {},
            builder: (controller) {
              return Padding(
                padding: EdgeInsets.all(18.0.r),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 300,
                        child: ModelViewer(
                          arScale: ArScale.fixed,
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
                          Text('${widget.product.price * quantity} DT',
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
                              Text('4.5'),
                              Icon(
                                Icons.star,
                                color: AppColors.primary,
                                size: 20.sp,
                              ),
                            ],
                          )
                        ],
                      ),

                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        "Couleurs",
                        style: AppTextStyle.subTitleTextStyle,
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

                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        "Description",
                        style: AppTextStyle.subTitleTextStyle,
                      ),
                      Text(widget.product.description,
                          style: AppTextStyle.greySubTitleTextStyle),
                      // Text(controller.products[0].fournisseur.toString(),
                      //   style: AppTextStyle.darkLabelTextStyle),

                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        "Rate product",
                        style: AppTextStyle.subTitleTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  stars = 1;
                                });
                              },
                              icon: stars > 0
                                  ? Icon(
                                      Icons.star,
                                      color: AppColors.primary,
                                    )
                                  : Icon(Icons.star_border)),
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  stars = 2;
                                });
                              },
                              icon: stars >= 2
                                  ? Icon(
                                      Icons.star,
                                      color: AppColors.primary,
                                    )
                                  : Icon(Icons.star_border)),
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  stars = 3;
                                });
                              },
                              icon: stars > 2
                                  ? Icon(
                                      Icons.star,
                                      color: AppColors.primary,
                                    )
                                  : Icon(Icons.star_border))
                        ],
                      ),

                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Comments",
                            style: AppTextStyle.subTitleTextStyle,
                          ),
                          IconButton(
                              onPressed: () {
                                expandableController.toggle();
                                setState(() {
                                  expanded = !expanded;
                                });
                              },
                              icon: expanded
                                  ? const Icon(
                                      Icons.keyboard_arrow_up_rounded,
                                      color: AppColors.primary,
                                    )
                                  : const Icon(
                                      Icons.keyboard_arrow_down_rounded))
                        ],
                      ),
                      ExpandablePanel(
                          controller: expandableController,
                          collapsed: Container(),
                          expanded: CommentWidget(
                            productId: widget.product.id,
                          )),
                      SizedBox(
                        height: 20.h,
                      ),
                      PrimaryButton(
                          text: "Add to cart",
                          onClick: () {
                            setState(() {
                              addToCartItems++;
                            });
                          })
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
