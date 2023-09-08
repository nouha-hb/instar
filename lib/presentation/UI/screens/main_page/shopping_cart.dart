import 'package:flutter/material.dart';
import 'package:instar/core/style/assets.dart';
import 'package:instar/domain/entities/paiement.dart';
import 'package:instar/presentation/UI/screens/paiement/detail_paiement.dart';
import 'package:instar/presentation/UI/widgets/custom_button.dart';
import 'package:instar/presentation/UI/widgets/shopping_list_component.dart';

class ShoppingList extends StatelessWidget {
  const ShoppingList({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const ShoppingComponent(
                image_path: Assets.product,
                product_name: 'Fauteuil à hausse',
                brand_name: "SMB Design",
                price: "250 DT"),
            const ShoppingComponent(
                image_path: Assets.product,
                product_name: 'Fauteuil à hausse',
                brand_name: "SMB Design",
                price: "250 DT"),
            const ShoppingComponent(
                image_path: Assets.product,
                product_name: 'Fauteuil à hausse',
                brand_name: "SMB Design",
                price: "250 DT"),
            const ShoppingComponent(
                image_path: Assets.product,
                product_name: 'Fauteuil à hausse',
                brand_name: "SMB Design",
                price: "250 DT"),
            PrimaryButton(
              text: "Acheter",
              onClick: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PaiementDetail(),
                    ));
              },
            )
          ],
        ),
      ),
    );
  }
}
