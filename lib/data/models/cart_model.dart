
import 'package:instar/domain/entities/cart.dart';

// ignore: must_be_immutable
class CartModel extends Cart {
  CartModel(
      {required super.id, required super.userId, required super.sales});

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
      id: json['_id'],
      userId: json['userId'],
      sales:json['sales']);

   Map<String, dynamic> toJson() => {
    "_id":id,
    "userId":userId,
    "sales":sales
  };
}
