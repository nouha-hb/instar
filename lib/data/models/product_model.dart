import '../../domain/entities/product.dart';

class ProductModel extends Product {
  const ProductModel(
      {
      required super.category,  
      required super.id,  
      required super.name,
      required super.description,
      required super.price,
      required super.quantity});

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(id: json['_id'],category: json['category'],
      name: json['name'], description: json['description'], price: json['price'], quantity: json['quantity']);

  Map<String, dynamic> toJson() => {
        '_id':id,
        'category':category,
        'name': name,
        'description': description,
        'price': price,
        'quantity': quantity
      };
}
