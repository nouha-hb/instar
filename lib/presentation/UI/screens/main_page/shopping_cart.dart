import 'package:flutter/material.dart';
import 'package:instar/core/style/assets.dart';
import 'package:instar/presentation/UI/widgets/shopping_list_component.dart';

class ShoppingList extends StatelessWidget {
  const ShoppingList({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ShoppingComponent(
            image_path: Assets.product,
            product_name: 'Fauteuil à hausse',
            brand_name: "SMB Design",
            price: "250 DT"));
  }
}
