import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../UI/screens/products/product_static_list.dart';

class ProductListController extends GetxController {
  var categories = ["All", "tables", "mmeubles", "decoration", "xxxx", "xxxx"];
  int selectedIndex = 0;
   TextEditingController textController = TextEditingController();

  List<Product> products = [
    Product(
      name: 'Table',
      description: '5 chairs wooden table confortable for a famolu',
      image: '',
      price: 200,
    ),
    Product(
      name: 'Table',
      description: '5 chairs wooden table confortable for a famolu',
      image: '',
      price: 200,
    ),
    Product(
      name: 'Table',
      description: '5 chairs wooden table confortable for a famolu',
      image: '',
      price: 200,
    ),
    Product(
      name: 'Table',
      description: '5 chairs wooden table confortable for a famolu',
      image: '',
      price: 200,
    ),
    Product(
      name: 'Table',
      description: '5 chairs wooden table confortable for a famolu',
      image: '',
      price: 200,
    ),
  ];
}
