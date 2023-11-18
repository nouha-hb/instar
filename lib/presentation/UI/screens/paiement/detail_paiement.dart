import 'package:checkbox_grouped/checkbox_grouped.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instar/core/style/colors.dart';
import 'package:instar/presentation/UI/screens/main_page/shopping_cart.dart';
import 'package:instar/presentation/UI/screens/paiement/paiement.dart';


class PaiementDetail extends StatefulWidget {
  const PaiementDetail({super.key});

  @override
  State<PaiementDetail> createState() => _PaiementDetailState();
}

class _PaiementDetailState extends State<PaiementDetail> {
  String info = '';

  List<String> text = ["E-dianar", "Carte Bancaire ", "Konnect"];

  GroupController controllerg = GroupController(isMultipleSelection: false);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
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
                          onPressed: () => Navigator.pop(context),
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: AppColors.black,
                            size: 30.sp,
                          ),
                        ),
                        const Text("Détails de paiement",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        IconButton(
                          onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ShoppingList())),
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
                    const Text(
                      "Payment",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 230.0,
                      child: SimpleGroupedCheckbox<String>(
                        controller: controllerg,
                        itemsTitle: text,
                        values: const ["A", "S", "B"],
                        onItemSelected: (value) {
                          info = value.join("").toString();
                          print(info);
                        },
                        groupStyle: GroupStyle(
                          activeColor: Colors.red,
                        ),
                      ),
                    ),
                    Container(
                      height: 100.h,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            // Fonction à exécuter lorsque le bouton est pressé
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: const Color(0Xff93B6F9), backgroundColor: Colors.white,
    
                            // Couleur du texte
                            fixedSize: const Size(140, 50),
                            side: const BorderSide(
                                color:
                                    Color(0Xff93B6F9)), // Couleur de la bordure
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(8.0), // Bordure arrondie
                            ),
                          ),
                          child: const Text("Annuler"),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Paiementt(),
                                ));
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white, backgroundColor: const Color(0Xff93B6F9), fixedSize: const Size(140, 50), // Couleur du texte
                            side: const BorderSide(
                                color:
                                    Color(0Xff93B6F9)), // Couleur de la bordure
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(8.0), // Bordure arrondie
                            ),
                          ),
                          child: const Text("Confirmer"),
                        ),
                      ],
                    ),
                  ],
                ),
              
         
      ),
    );
  }
}
