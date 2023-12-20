import 'package:dartz/dartz.dart' as dartz;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:instar/core/errors/failures/failures.dart';
import 'package:instar/core/style/colors.dart';
import 'package:instar/core/style/text_style.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:instar/di.dart';
import 'package:instar/domain/entities/product.dart';
import 'package:instar/domain/usecases/fournisseur_usecases/get_fournisseur_by_id_usecase.dart';
import 'package:instar/domain/usecases/widhlist_usecases/update_wishlist_usecase.dart';
import 'package:instar/presentation/UI/screens/products/product_description.dart';
import 'package:instar/presentation/UI/screens/splash_screen/splash_screen.dart';
import 'package:instar/presentation/state_managment/controllers/product_details_controller.dart';
import 'package:instar/presentation/state_managment/controllers/wishlist_controller.dart';

import '../../../core/constant/api_const.dart';
import '../../../domain/entities/fournisseur.dart';
import '../../../domain/entities/wishlist.dart';
import '../../state_managment/controllers/main_page_controller.dart';

class FavoriteComponent extends StatefulWidget {
  final Product product;

  const FavoriteComponent({super.key, required this.product});

  @override
  State<FavoriteComponent> createState() => _FavoriteComponentState();
}

class _FavoriteComponentState extends State<FavoriteComponent> {
  @override
  Widget build(BuildContext context) {

    return GetBuilder<ProductDetailsController>(
        init: ProductDetailsController(),
        initState: (_) {},
        builder: (controller) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical:10.0.r),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDesc(product: widget.product),
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
                            await controller.favouriteToggle(widget.product);                              
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
                                    "${ApiConst.files}/${widget.product.image}",fit: BoxFit.cover,width: 100.w,height: 100.h,),
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
                                    widget.product.name,
                                    style: AppTextStyle.elementNameTextStyle13,
                                  ),
                                  FutureBuilder<dartz.Either<Failure, Fournisseur>>(
                                    future: GetFournisseursByIdUsecase(sl()).call(widget.product.provider),
                                    builder: (context, snapshot) {
                                      String  name=widget.product.category;
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
                                    '${widget.product.price
                                        .toString()} DT',
                                    style: AppTextStyle.blueLabelTextStyle,
                                  ),
                                ],
                              )
                            ],
                          )),
                     
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
