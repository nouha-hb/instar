import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instar/presentation/UI/screens/main_page/categories_page.dart';
import 'package:instar/presentation/UI/screens/main_page/favorite_page.dart';
import 'package:instar/presentation/UI/screens/main_page/home_page.dart';
import 'package:instar/presentation/UI/screens/main_page/shopping_cart.dart';

import '../../UI/screens/main_page/profile_page.dart';

class MainController extends GetxController {
  int currentIndex = 0;
  void onTap(index) {
    currentIndex = index;
    update();
  }

  TextEditingController textController = TextEditingController();
  final pages =  [
    {
      "name": "Acceuil",
      "page": Home(),
    },
    {
      "name": "Catégories",
      "page": Categories(),
    },
    {
      "name": "Panier",
      "page": ShoppingList(),
    },
    {
      "name": "favorite",
      "page": favoriteList(),
    },
  ];

  // var categories = ["All", "tables", "mmeubles", "decoration", "xxxx", "xxxx"];
  // int selectedIndex = 0;
  //  TextEditingController textController = TextEditingController();

  // List<Product> products = [
  //   Product(
  //     name: 'Table',
  //     description: '5 chairs wooden table confortable for a famolu',
  //     image: '',
  //     price: 200,
  //   ),
  //   Product(
  //     name: 'Table',
  //     description: '5 chairs wooden table confortable for a famolu',
  //     image: '',
  //     price: 200,
  //   ),
  //   Product(
  //     name: 'Table',
  //     description: '5 chairs wooden table confortable for a famolu',
  //     image: '',
  //     price: 200,
  //   ),
  //   Product(
  //     name: 'Table',
  //     description: '5 chairs wooden table confortable for a famolu',
  //     image: '',
  //     price: 200,
  //   ),
  //   Product(
  //     name: 'Table',
  //     description: '5 chairs wooden table confortable for a famolu',
  //     image: '',
  //     price: 200,
  //   ),
  // ];
}
