import 'package:checkbox_grouped/checkbox_grouped.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:instar/core/style/colors.dart';
import 'package:instar/core/style/text_style.dart';
import 'package:instar/domain/entities/paiement.dart';
import 'package:instar/presentation/UI/screens/paiement/paiement.dart';
import 'package:instar/presentation/UI/screens/shopping_cart/shopping_cart_list.dart';
import 'package:instar/presentation/UI/widgets/custom_button.dart';

import '../../../state_managment/controllers/product_list_controller.dart';

class PaiementDetail extends StatefulWidget {
  

  const PaiementDetail({super.key});

  @override
  State<PaiementDetail> createState() => _PaiementDetailState();
}

class _PaiementDetailState extends State<PaiementDetail> {
  String info='';

  List<String> text = ["E-dianar", "Carte Bancaire ", "Konnect"];



  GroupController controllerg = GroupController(isMultipleSelection:false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ProductListController>(
          init: ProductListController(),
          initState: (_) {},
          builder: (controller) {
            return Padding(
              padding: EdgeInsets.all(18.0.r),
              child: Column(
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
                        onPressed: () => Get.back(),
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: AppColors.black,
                          size: 30.sp,
                        ),
                      ),
                      Text("Détails de paiement",style: TextStyle(fontWeight: FontWeight.bold)),
                      IconButton(
                        onPressed: () =>  Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ShoppingCart()
                                  )),
                        icon: Icon(
                          Icons.shopping_cart_checkout_rounded,
                          color: AppColors.black,
                          size: 30.sp,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                   Text("Payment",style: TextStyle(fontWeight: FontWeight.bold),),
                      Container(
            height: 230.0,
            child:  SimpleGroupedCheckbox<String>(
              controller: controllerg,
              itemsTitle: text,
              values: ["A","S","B"],
              onItemSelected: (value){

              info =value.join("").toString() ;
              print(info);



              },
              groupStyle: GroupStyle(
                activeColor: Colors.red,
              
              ),
          
            ),),
                 
                  
                  Container(
                    height: 100.h,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  Row(
                    mainAxisAlignment:MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                           child: Text("Annuler"), 
      onPressed: () {
        // Fonction à exécuter lorsque le bouton est pressé
      },
      style: ElevatedButton.styleFrom(
        primary: Colors.white, // Couleur de l'arrière-plan
        onPrimary: Color(0Xff93B6F9), 
        
      // Couleur du texte
      fixedSize: Size(140, 50),
        side: BorderSide(color: Color(0Xff93B6F9)), // Couleur de la bordure
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0), // Bordure arrondie
        ),
      ),),
       ElevatedButton(
                           child: Text("Confirmer"), 
      onPressed: () {
        Get.to(Paiementt());
      },
      style: ElevatedButton.styleFrom(
        fixedSize: Size(140, 50),
        primary: Color(0Xff93B6F9), // Couleur de l'arrière-plan
        onPrimary: Colors.white, // Couleur du texte
        side: BorderSide(color: Color(0Xff93B6F9)), // Couleur de la bordure
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0), // Bordure arrondie
        ),
      ),),
                    ],
                  ),
                  
                ],
              ),
            );
          }),
    );
  }
}
