import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:instar/core/l10n/plural_strings.dart';
import 'package:instar/core/style/colors.dart';
import 'package:instar/core/style/text_style.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:instar/domain/entities/reclamation.dart';

import 'package:instar/presentation/UI/widgets/step_item.dart';
import 'package:instar/presentation/state_managment/controllers/order_tracking_controller.dart';

import '../../widgets/sale_item.dart';

class OrderTrackingScreen extends StatelessWidget {
  final Reclamation reclamation;
  const OrderTrackingScreen({super.key,required this.reclamation});
  
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: OrderTrackingController(),
      builder:(c)=> Scaffold(
        backgroundColor: AppColors.bgColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.bgColor,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios,
              color: AppColors.black,
            ),
          ),
          title: Text(AppLocalizations.of(context)!.order_tracking,
              style:  AppTextStyle.elementNameTextStyle),
          centerTitle: true,
          // actions: [
          //   IconButton(
          //     onPressed: () => Navigator.push(context,
          //         MaterialPageRoute(builder: (context) => const ShoppingList())),
          //     icon:const Icon(
          //       Icons.shopping_cart_outlined,
          //       color: AppColors.black,
          //     ),
          //   ),
          // ],
        ),
        body: FutureBuilder(
          future:c.getSales(reclamation) ,
          builder:(ctx,snapshot){
            if(snapshot.hasData){
              return Padding(
            padding: EdgeInsets.all(18.0.r),
            child: SizedBox(
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.order_items,
                            style: AppTextStyle.subTitleTextStyle,
                          ),
                          Text(
                            PluralStrings.numberOfItems(c.salesList.length,
                                context), //AppLocalizations.of(context)!.order_items,
                            style: AppTextStyle.greySubTitleTextStyle,
                          ),
                        ],
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: c.salesList.map((e)=>InkWell(
                            onTap: (){c.selecteSale(c.salesList.indexOf(e));c.changeSale(c.products.firstWhere((element) => e.productId==element.id).id);},
                            child: SaleItem(product: c.products.firstWhere((element) => e.productId==element.id), sale: e,isSelected: c.salesList.indexOf(e)==c.selected,))).toList()
                        ),
                      ),
                      Text(
                        AppLocalizations.of(context)!.track_package,
                        style: AppTextStyle.subTitleTextStyle,
                      ),
                      Stepper(
                          currentStep: c.getSaleStep(c.sale.status),
                          onStepContinue: null,
                          onStepCancel: null,
                          onStepTapped: null,
                          controlsBuilder: (context, details) => Container(),
                          steps: [
                            StepItem.makeStep(
                              isActive:  c.getSaleStep(c.sale.status)==0,
                                title: AppLocalizations.of(context)!
                                    .order_confirmation,
                                location: 'Tuinis, Tunisie',
                                date: "12:30 11/03/2023",
                                state:  c.getSaleStep(c.sale.status)>0?StepState.complete:StepState.indexed),
                            StepItem.makeStep(
                               isActive:  c.getSaleStep(c.sale.status)==1,
                                title:
                                    AppLocalizations.of(context)!.ongoing_treatment,
                                location: 'Tuinis, Tunisie',
                                date: "12:30 11/03/2023",
                                state:  c.getSaleStep(c.sale.status)>1?StepState.complete:StepState.indexed),
                            StepItem.makeStep(
                               isActive:  c.getSaleStep(c.sale.status)==2,
                                title: AppLocalizations.of(context)!.in_preparation,
                                location: 'Tuinis, Tunisie',
                                date: "12:30 11/03/2023",
                               state:  c.getSaleStep(c.sale.status)>2?StepState.complete:StepState.indexed),
                            StepItem.makeStep(
                               isActive:  c.getSaleStep(c.sale.status)==3,
                                title: AppLocalizations.of(context)!.shipping,
                                location: '',
                                date: "",
                               state:  c.getSaleStep(c.sale.status)>3?StepState.complete:StepState.indexed),
                            StepItem.makeStep(
                               isActive:  c.getSaleStep(c.sale.status)==4,
                                title: AppLocalizations.of(context)!.delivery,
                                location: '',
                                date: "",
                               state:  c.getSaleStep(c.sale.status)>4?StepState.complete:StepState.indexed)
                          ])
                    ]),
              ),
            ),
          );
            }else if(snapshot.connectionState == ConnectionState.waiting){
              return const Center(child: CircularProgressIndicator(),);
            }else{
              return const Center(child: Text('error'),);
            }
          } 
        ),
      ),
    );
  }
}
