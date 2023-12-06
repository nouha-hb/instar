import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instar/core/style/colors.dart';
import 'package:instar/core/style/text_style.dart';
import 'package:instar/di.dart';
import 'package:instar/domain/entities/product.dart';
import 'package:instar/domain/entities/wishlist.dart';
import 'package:instar/domain/usecases/widhlist_usecases/update_wishlist_usecase.dart';
import 'package:instar/presentation/UI/screens/products/product_description.dart';
import 'package:instar/presentation/UI/screens/splash_screen/splash_screen.dart';

import '../../../core/constant/api_const.dart';

class ProductComponent extends StatefulWidget {
  final Product product;

  const ProductComponent({
    super.key,
    required this.product,
  });

  @override
  State<ProductComponent> createState() => _ProductComponentState();
}

class _ProductComponentState extends State<ProductComponent> {
  bool favorite = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(6.0.r),
      child: InkWell(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductDesc(product: widget.product))),
        child: Container(
          width: 155.w,
          height: 220.h,
          decoration: BoxDecoration(
              // boxShadow: [
              //   BoxShadow(
              //       color: AppColors.grey, spreadRadius: 0, blurRadius: 5.r),
              // ],
              color: AppColors.white,
              borderRadius: BorderRadius.circular(15.r)),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(15.r),topRight: Radius.circular(15.r)),
                      child: Image.network(
                        "${ApiConst.files}/${widget.product.image}",fit: BoxFit.cover,height: 150.h,width: 155.w,),
                    ),
                    Positioned(
                      top: 5,
                      right: 5,
                      child: InkWell(
                        onTap: () async {
                  setState(() {
                    favorite = !favorite;
                  });
                  if (favorite) {
                    WishList wishlist = WishList(
                        id: SplashScreen.wishList!.id,
                        userId: SplashScreen.wishList!.userId,
                        productsId: SplashScreen.wishList!.productsId);

                    setState(() {
                      SplashScreen.wishList!.productsId
                          .add(widget.product.id);
                      UpdateWishListUsecase(sl())
                          .call(wishlist: wishlist);
                    });
                  } else {
                    setState(() {
                      SplashScreen.wishList!.productsId
                          .remove(widget.product.id);
                    });
                  }
                },
                        child: Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.lightgrey,
                          ),
                          width: 30.w,
                          height: 30.h,
                          child: favorite
                              ? const Icon(
                                  Icons.favorite,
                                  color: AppColors.primary,
                                )
                              : const Icon(
                                  Icons.favorite_outline,
                                  color: AppColors.black,
                                ),
                        ),
                      ),
                    ),
                    
                  ],
                ),
                
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.product.name,
                        style: AppTextStyle.elementNameTextStyle13,
                      ),
                       Text(
                    widget.product.id,
                    style: AppTextStyle.elementNameTextStyle13,
                  ),
                    ],
                  ),
                ),
               
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      widget.product.category,
                      style: AppTextStyle.smallLightLabelTextStyle,
                    ),
                    Text(
                      "${widget.product.price}DT",
                      style: AppTextStyle.blueLabelTextStyle,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
