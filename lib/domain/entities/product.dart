import 'package:equatable/equatable.dart';
import 'package:instar/domain/entities/Product3D.dart';

class Product extends Equatable {
  final String id;
  final String name;
  final String description;
  final double price;
  final int quantity;
  final String category;
  final String subCategory;
  final String image;
  final List<Product3D> image3D;
  final String provider;
  final String dimensions;
  const Product(
      {required this.category,
      required this.id,
      required this.dimensions,
      required this.name,
      required this.description,
      required this.price,
      required this.quantity,
      required this.subCategory,
      required this.image,
      required this.provider,
      required this.image3D});

  @override
  List<Object?> get props => [
        name,
        description,
        price,
        quantity,
        category,
        subCategory,
        image,
        image3D,
        provider,
        dimensions
      ];
}
