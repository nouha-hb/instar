import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:instar/core/l10n/plural_strings.dart';
import 'package:instar/core/style/colors.dart';
import 'package:instar/core/style/text_style.dart';
import 'package:instar/domain/entities/Product3D.dart';
import 'package:instar/domain/entities/product.dart';
import 'package:instar/presentation/UI/screens/main_page/shopping_cart.dart';
import 'package:instar/presentation/UI/widgets/comment.dart';
import 'package:instar/presentation/UI/widgets/custom_button.dart';
import 'package:badges/badges.dart' as badges;
import 'package:instar/presentation/UI/widgets/rating_widgets/rating_section.dart';
import 'package:instar/presentation/state_managment/controllers/product_details_controller.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import '../../../../core/constant/api_const.dart';

class ProductDesc extends StatefulWidget {
  final Product product;
  const ProductDesc({super.key, required this.product});

  @override
  State<ProductDesc> createState() => _ProductDescState();
}

class _ProductDescState extends State<ProductDesc> {
  late Product3D currentTexture;
  Key _refreshKey = UniqueKey();
  @override
  void initState() {
    productDetailsController = ProductDetailsController();
    expandableController = ExpandableController();
    currentTexture = widget.product.image3D[0];
    super.initState();
  }

  @override
  void dispose() {
    expandableController.dispose();
    productDetailsController.dispose();
    super.dispose();
  }

  bool expanded = false;
  int quantity = 1;
  int addToCartItems = 0;
  late ExpandableController expandableController;
  late ProductDetailsController productDetailsController;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailsController>(
      init: productDetailsController,
      initState: (state) async{
        await productDetailsController.getExistingRate(widget.product.id);
      },
      builder: (controller) {
        return Scaffold(
            backgroundColor: AppColors.bgColor,
            body: FutureBuilder(
                initialData: false,
                future: controller.loadData(widget.product),
                builder: (ctx, snapshot) {
                  if (snapshot.hasData && snapshot.data!) {
                    return CustomScrollView(slivers: [
                      SliverAppBar(
                        automaticallyImplyLeading: false,
                        floating: true,
                        pinned: true,
                        snap: true,
                        backgroundColor: AppColors.bgColor,
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
                              badgeAnimation:
                                  const badges.BadgeAnimation.rotation(
                                animationDuration: Duration(seconds: 1),
                                colorChangeAnimationDuration:
                                    Duration(seconds: 1),
                                loopAnimation: false,
                                curve: Curves.fastOutSlowIn,
                                colorChangeAnimationCurve: Curves.easeInCubic,
                              ),
                              badgeStyle: const badges.BadgeStyle(
                                shape: badges.BadgeShape.circle,
                                badgeColor: AppColors.primary,
                              ),
                              child: IconButton(
                                onPressed: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ShoppingList())),
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
                      SliverList(
                          delegate: SliverChildListDelegate([
                        Padding(
                            padding: EdgeInsets.all(18.0.r),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 300,
                                  child: ModelViewer(
                                    arScale: ArScale.fixed,
                                    key: _refreshKey,
                                    backgroundColor: const Color.fromARGB(
                                        0xFF, 0xEE, 0xEE, 0xEE),
                                    src:
                                        'assets/images/${currentTexture.model3D}',
                                    alt: 'A 3D model of an astronaut',
                                    ar: true,
                                    autoRotate: true,
                                    // iosSrc: 'https://modelviewer.dev/shared-assets/models/Astronaut.usdz',
                                    disableZoom: true,
                                  ),
                                ),

                                SizedBox(
                                  height: 20.h,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(widget.product.name.toString(),
                                        style: AppTextStyle
                                            .producDescTitiletTextStyle),
                                    Text('${widget.product.price} DT',
                                        style: AppTextStyle.blueLabelTextStyle),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "${controller.provider.name}",
                                      style: AppTextStyle.lightLabelTextStyle,
                                    ),
                                    PluralStrings.onOrder(currentTexture.quantity, context),
                                  ],
                                ),

                                const SizedBox(
                                  height: 15,
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
                                            radius: e.id == currentTexture.id
                                                ? 13
                                                : 10,
                                            backgroundImage: NetworkImage(
                                                '${ApiConst.files}/${e.texture}')),
                                      ),
                                    );
                                  }).toList(),
                                ),

                                const SizedBox(
                                  height: 25,
                                ),
                                Text(
                                  "Description",
                                  style: AppTextStyle.subTitleTextStyle,
                                ),
                                Text(widget.product.description,
                                    style: AppTextStyle.greySubTitleTextStyle),
                                const SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  children: [
                                    Text('Category: ',
                                        style: AppTextStyle
                                            .greySubTitleLabelTextStyle),
                                    Text('Salon, Tapis',
                                        style:
                                            AppTextStyle.greySubTitleTextStyle),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text('Dimensions: ',
                                        style: AppTextStyle
                                            .greySubTitleLabelTextStyle),
                                    Text(widget.product.dimensions,
                                        style:
                                            AppTextStyle.greySubTitleTextStyle),
                                  ],
                                ),
                                // Text(controller.products[0].fournisseur.toString(),
                                //   style: AppTextStyle.darkLabelTextStyle),

                                const SizedBox(
                                  height: 25,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Rate product",
                                      style: AppTextStyle.subTitleTextStyle,
                                    ),
                                    Text(
                                      '${controller.numberRates.toString()} rates',
                                      style: AppTextStyle.greySubTitleTextStyle,
                                    ),
                                  ],
                                ),
                                RatingSection(),

                                SizedBox(
                                  height: 15.h,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                            : const Icon(Icons
                                                .keyboard_arrow_down_rounded))
                                  ],
                                ),
                                ExpandablePanel(
                                    controller: expandableController,
                                    collapsed: Container(),
                                    expanded: CommentWidget(
                                      productId: widget.product.id,
                                    )),
                                const SizedBox(
                                  height: 25,
                                ),
                                Text(
                                  "purchasing",
                                  style: AppTextStyle.subTitleTextStyle,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    RichText(
                                        text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'total: ',
                                          style: AppTextStyle
                                              .greySubTitleLabelTextStyle,
                                        ),
                                        TextSpan(
                                          text:
                                              '${productDetailsController.orderedQuantity * widget.product.price} DT',
                                          style:
                                              AppTextStyle.blueLabelTextStyle,
                                        ),
                                      ],
                                    )),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            productDetailsController
                                                .incQuantity(
                                                    widget.product.quantity);
                                          },
                                          child: Container(
                                            color: AppColors.primary,
                                            height: 30.h,
                                            width: 25.w,
                                            child: Center(
                                                child: Icon(
                                              Icons.add,
                                              size: 16.sp,
                                              color: AppColors.white,
                                            )),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 30.h,
                                          width: 25.w,
                                          child: Center(
                                              child: Text(
                                            productDetailsController
                                                .orderedQuantity
                                                .toString(),
                                            style: const TextStyle(
                                                color: AppColors.black,
                                                fontSize: 18),
                                          )),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            productDetailsController
                                                .decQuantity();
                                          },
                                          child: Container(
                                            color: AppColors.primary,
                                            height: 30.h,
                                            width: 25.w,
                                            child: Center(
                                                child: Icon(Icons.remove,
                                                    size: 16.sp,
                                                    color: AppColors.white)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 25,
                                ),
                                PrimaryButton(
                                    text: "Add to cart",
                                    onClick: () {
                                      setState(() {
                                        addToCartItems++;
                                      });
                                    })
                              ],
                            ))
                      ])),
                    ]);
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return const Center(
                      child: Text('error'),
                    );
                  }
                }));
      },
    );
  }
}
