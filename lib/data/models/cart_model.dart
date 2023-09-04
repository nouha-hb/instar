
import 'package:instar/domain/entities/cart.dart';

class CartModel extends Cart {
  CartModel(
      {required super.id, required super.userId, required super.productsId});

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
      id: json['_id'],
      userId: json['userId'],
      productsId:
          (json['products'] as List).map((e) => e['_id'].toString()).toList());

  Map<String, dynamic> toJson() => {
    "_id":id,
    "userId":userId,
    "products":productsId.map((e) =>{'_id':id}).toList()
  };
}