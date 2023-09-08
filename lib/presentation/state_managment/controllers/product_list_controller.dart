import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../UI/screens/products/product_static_list.dart';

class ProductListController extends GetxController {
  bool isPressed1 = false;
  bool isPressed2 = false;
  bool isPressed3 = false;

  void onTapStar1() {
    isPressed1 = !isPressed1;
    update();
  }
  void onTapStar2() {
    isPressed2 = !isPressed2;
    update();
  }  void onTapStar3() {
    isPressed3 = !isPressed3;
    update();
  }
  var categories = ["All", "tables", "mmeubles", "decoration", "xxxx", "xxxx"];
  int selectedIndex = 0;
  TextEditingController textController = TextEditingController();

  List<Product> products = [
    Product(
      fournisseur: 'Meuble S B',
      name: 'Table',
      description: '5 chairs wooden table confortable for a famolu',
      image: '',
      price: 200,
    ),
    Product(
      fournisseur: 'Meuble',
      name: 'Table',
      description: '5 chairs wooden table confortable for a famolu',
      image: '',
      price: 200,
    ),
    Product(
      fournisseur: 'Meuble',
      name: 'Table',
      description: '5 chairs wooden table confortable for a famolu',
      image: '',
      price: 200,
    ),
    Product(
      fournisseur: 'Meuble',
      name: 'Table',
      description: '5 chairs wooden table confortable for a famolu',
      image: '',
      price: 200,
    ),
    Product(
      fournisseur: 'Meuble',
      name: 'Table',
      description: '5 chairs wooden table confortable for a famolu',
      image: '',
      price: 200,
    ),
  ];
}
