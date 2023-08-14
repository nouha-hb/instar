import 'package:flutter/material.dart';
import 'package:instar/core/style/assets.dart';
import 'package:instar/presentation/UI/widgets/shopping_list_component.dart';

class favoriteList extends StatelessWidget {
  const favoriteList({super.key});

  @override
  Widget build(BuildContext context) {
    return const  Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ShoppingComponent(
                  image_path: Assets.product,
                  product_name: 'Fauteuil à hausse',
                  brand_name: "SMB Design",
                  price: "250 DT"),
                        ShoppingComponent(
                  image_path: Assets.product,
                  product_name: 'Fauteuil à hausse',
                  brand_name: "SMB Design",
                  price: "250 DT"),      ShoppingComponent(
                  image_path: Assets.product,
                  product_name: 'Fauteuil à hausse',
                  brand_name: "SMB Design",
                  price: "250 DT"),      ShoppingComponent(
                  image_path: Assets.product,
                  product_name: 'Fauteuil à hausse',
                  brand_name: "SMB Design",
                  price: "250 DT"),
           
             
            ],
          ),
        ),);
  }
}
