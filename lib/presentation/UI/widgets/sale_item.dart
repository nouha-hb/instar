import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instar/domain/entities/product.dart';

import '../../../core/constant/api_const.dart';
import '../../../core/style/colors.dart';
import '../../../core/style/text_style.dart';
import '../../../domain/entities/sales.dart';

// ignore: must_be_immutable
class SaleItem extends StatelessWidget {
  bool isSelected=false;
 final Sales sale;
 final Product product;
  SaleItem({super.key, required this.product,required this.sale,required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(6.0.r),
      child: SizedBox(
        width:     isSelected? 155.w:140.w,
 
        child: Container(
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
                ClipRRect(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(15.r),topRight: Radius.circular(15.r)),
                  child: Image.network(
                    "${ApiConst.files}/${product.image}",fit: BoxFit.cover,width: double.infinity ,height: isSelected? 120.h:100.h,),
                ),      
                Padding(
                  padding: const EdgeInsets.all( 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name,
                        style: AppTextStyle.elementNameTextStyle13,
                      ),const SizedBox(height: 5,),
                       RichText(text: TextSpan(children: [TextSpan( text:"Ref: ",style:AppTextStyle.greyTextStyle1 ),TextSpan( text:product.reference,style:AppTextStyle.blueTextStyle1 )])),
                RichText(text: TextSpan(children: [TextSpan( text:"total price: ",style:AppTextStyle.greyTextStyle1 ),
                TextSpan( text:"${sale.totalPrice}DT",style:AppTextStyle.blueTextStyle1 )])),
       RichText(text: TextSpan(children: [TextSpan( text:"quantity: ",style:AppTextStyle.greyTextStyle1 ),
                TextSpan( text:sale.quantity.toString(),style:AppTextStyle.blueTextStyle1 )])),
                    ],
                  ),
                ),
               
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}