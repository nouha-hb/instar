import 'package:instar/domain/entities/wishlist.dart';

class WishListModel extends WishList {
  WishListModel(
      {required super.id, required super.userId, required super.productsId});

  factory WishListModel.fromJson(Map<String, dynamic> json) => WishListModel(
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