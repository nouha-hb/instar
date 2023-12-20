import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String id;
  final String  reference;
  final String name;
  final String description;
  final double price;
  final int quantity;
  final String category;
  final String subCategory;
  final String image;
  final String provider;
  final String dimensions;
  const Product(
      {required this.category,
      required this.reference,
      required this.id,
      required this.dimensions,
      required this.name,
      required this.description,
      required this.price,
      required this.quantity,
      required this.subCategory,
      required this.image,
      required this.provider,
    });

  @override
  List<Object?> get props => [
        name,
        reference,
        description,
        price,
        quantity,
        category,
        subCategory,
        image,
        provider,
        dimensions
      ];
}