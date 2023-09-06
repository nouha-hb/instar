import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../domain/entities/Product3D.dart';
import '../../UI/screens/products/product_description.dart';
import '../../UI/screens/products/product_shopping_list.dart';

class ProductDescController extends GetxController {
  bool isPressed1 = false;
  bool isPressed2 = false;
  bool isPressed3 = false;

  int quantity = 1;
  static int addToCartItems = 0;
  static double total = 0;
  void onTapStar1() {
    isPressed1 = !isPressed1;
    update();
  }

  void onTapStar2() {
    isPressed2 = !isPressed2;
    update();
  }

  void onTapStar3() {
    isPressed3 = !isPressed3;
    update();
  }

  var categories = ["All", "tables", "mmeubles", "decoration", "xxxx", "xxxx"];
  int selectedIndex = 0;
  TextEditingController textController = TextEditingController();
}
