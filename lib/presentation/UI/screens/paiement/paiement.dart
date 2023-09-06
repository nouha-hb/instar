import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:instar/core/style/colors.dart';
import 'package:instar/core/style/text_style.dart';
import 'package:instar/presentation/UI/widgets/custom_button.dart';
import 'package:instar/presentation/state_managment/controllers/product_desc_controller.dart';

import '../../../state_managment/controllers/paiement_controller.dart';

import '../../widgets/custom_textform.dart';

class Paiementt extends StatelessWidget {
  const Paiementt({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<PaiementController>(
          init: PaiementController(),
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
                      height: 30.h,
                    ),
                    Row(
                   
                      children: [
                        IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: AppColors.black,
                            size: 30.sp,
                          ),
                        ),
                        SizedBox(width: 50,),
                        Text("Méthode de paiement"),
                     
                      ],
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                     Text("Détails de la carte"),
                      SizedBox(
                      height: 20.h,
                    ),
                  ReusableTextField(
                          width: 326,
                          height: 40,
                          controller: controller.NomController,
                          keyboardType: TextInputType.name,
                          text: 'Nom',
                          validator: controller.requiredValidator,
                        ),
                      SizedBox(
                      height: 20.h,
                    ),
                        ReusableTextField(
                          width: 326,
                          height: 40,
                          controller: controller.CodeController,
                          keyboardType: TextInputType.name,
                          text: 'Code',
                          validator: controller.requiredValidator,
                        ),
                      SizedBox(
                      height: 20.h,
                    ),
                    
                
                           Row(children: [
                  ReusableTextField(
                          width: 150,
                          height: 40,
                          controller: controller.DateExpController,
                          keyboardType: TextInputType.name,
                          text: 'Date Exp',
                          validator: controller.requiredValidator,
                        ),
                          SizedBox(
                      width: 40.h,
                    ),
                            ReusableTextField(
                          width: 150,
                          height: 40,
                          controller: controller.CVVController,
                          keyboardType: TextInputType.name,
                          text: 'CVV',
                          validator: controller.requiredValidator,
                        ),
                           ],),
                    SizedBox(
                      height: 40.h,
                    ),
                           
Center(
  child:   Stack(
  
    children: [
  
    Image.asset("assets/images/elment.png"),
  
    Positioned(
  
      top: 110.h,
  
      left: 10.w,
  
      child: Text("Totale : "+ ProductDescController.total.toString(), 
  
      style: AppTextStyle.darkLabelTextStyle,),
  
    )
  
  ],),
),
                          SizedBox(
                      height: 20.h,
                    ),
                   SizedBox(
                      height: 90.h,
                    ),
                           
                    Align(
                        alignment: Alignment.bottomRight,
                        child: PrimaryButton(text: "Payez maintenant", onClick: () {
               controller.paiement();
                        })),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
