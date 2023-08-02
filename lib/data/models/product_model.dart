import '../../domain/entities/product.dart';

class ProductModel extends Product {
  const ProductModel(
      {required super.name,
      required super.description,
      required super.price,
      required super.quantity});

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
      name: json['name'], description: json['description'], price: json['price'], quantity: json['quantity']);

  Map<String, dynamic> toJson() => {
        'name': name,
        'description': description,
        'price': price,
        'quantity': quantity
      };
}
