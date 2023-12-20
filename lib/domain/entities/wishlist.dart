import 'package:equatable/equatable.dart';
import 'package:instar/domain/entities/product.dart';

class WishList extends Equatable {
  final String id;
  final String userId;
  List<Product> productsId;

  WishList({required this.id, required this.userId, required this.productsId});

  @override
  List<Object?> get props => [id, userId, productsId];
}
