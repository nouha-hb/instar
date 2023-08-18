import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String id;
  final String name;
  final String description;
  final double price;
  final int quantity;
  final String category;
  final String subCategory;
  final String image;
  final String image3D;
  const Product({
    required this.category,
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.quantity,
    required this.subCategory,
    required this.image,
    required this.image3D
  });

  @override
  // TODO: implement props
  List<Object?> get props => [name, description, price, quantity,category,subCategory,image,image3D];
}
