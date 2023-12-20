import 'package:dartz/dartz.dart' as dartz;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:instar/core/errors/failures/failures.dart';
import 'package:instar/core/style/colors.dart';
import 'package:instar/core/style/text_style.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:instar/domain/entities/cart.dart';
import 'package:instar/domain/entities/fournisseur.dart';
import 'package:instar/domain/entities/product.dart';
import 'package:instar/domain/entities/sales.dart';
import 'package:instar/domain/usecases/fournisseur_usecases/get_fournisseur_by_id_usecase.dart';
import 'package:instar/presentation/UI/screens/products/product_description.dart';
import 'package:instar/presentation/UI/screens/splash_screen/splash_screen.dart';
import 'package:instar/presentation/state_managment/controllers/cart_controller.dart';
import 'package:instar/presentation/state_managment/controllers/product_details_controller.dart';

import '../../../core/constant/api_const.dart';
import '../../../di.dart';
import '../../../domain/usecases/cart_usecases/update_cart_usecase.dart';
import '../../state_managment/controllers/main_page_controller.dart';
import '../../state_managment/controllers/product_desc_controller.dart';

class ShoppingComponent extends StatelessWidget {
  final Product product;
   Sales sale;

   ShoppingComponent({super.key, required this.product,required this.sale});
ProductDetailsController productDetailsController = ProductDetailsController();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
        init: CartController(),
        initState: (_) {},
        builder: (controller) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical:10.0.r),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDesc(product: product),
                    ));
              },
              child: Container(
                width: double.infinity,
                height: 100.h,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black38,
                          spreadRadius: 0,
                          blurRadius: 8.r),
                    ],
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(15.r)),
                child: Slidable(
                  endActionPane: ActionPane(
                    motion: const BehindMotion(),
                    children: [
                      SlidableAction(
                          borderRadius: BorderRadius.circular(15.r),
                          backgroundColor: AppColors.primary,
                          icon: Icons.delete,
                          label: "Delete",
                          onPressed: (context) async {
                          await controller.deleteSale(sale.id!);
                           productDetailsController.updateSalesCount(SplashScreen.cart.sales.length);

                              
                          }),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          width: 200.w,
                          height: 100.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.r),
                              color: AppColors.white
                              //color: AppColors.grey,
                              ),
                          child: Row(
                            children: [
                              ClipRRect(
                              borderRadius: BorderRadius.circular(15.r),
                                child: Image.network(
                                    "${ApiConst.files}/${product.image}",fit: BoxFit.cover,width: 100.w,height: 100.h,),
                              ),
                              SizedBox(
                                width: 20.w,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.center,
                                children: [
                                  Text(
                                    product.name,
                                    style: AppTextStyle.elementNameTextStyle13,
                                  ),
                               FutureBuilder<dartz.Either<Failure, Fournisseur>>(
                                    future: GetFournisseursByIdUsecase(sl()).call(product.provider),
                                    builder: (context, snapshot) {
                                      String  name=product.category;
                                     if(snapshot.hasData){
                                      final prv = snapshot.data;
                                      prv!.fold((l) {}, (r) => name=r.name);
                                     }
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(vertical:5.0),
                                        child: Text(
                                          name,
                                          style:
                                              AppTextStyle.greyTextStyle1,
                                        ),
                                      );
                                    }
                                  ),
                                  Text(
                                    '${((sale.totalPrice) * 1)
                                        .toString()} DT',
                                    style: AppTextStyle.blueLabelTextStyle,
                                  ),
                                ],
                              )
                            ],
                          )),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 60.w,
                          height: 25.h,
                          decoration: BoxDecoration(
                              color: AppColors.primary,
                              borderRadius: BorderRadius.circular(5.r)),
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () async{
                                  sale.quantity++;
                                 // await controller.updateSailes();
                                },
                                child: SizedBox(
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
                                   sale.quantity.toString(),
                                    style: const TextStyle(color: AppColors.white),
                                  )),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  sale.quantity--;
                                 // controller.updateSailes();
                                },
                                child: SizedBox(
                                  height: 25.h,
                                  width: 20.w,
                                  child: Center(
                                      child: Icon(Icons.remove,
                                          size: 16.sp, color: AppColors.white)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}