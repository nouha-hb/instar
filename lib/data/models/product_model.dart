import 'package:instar/data/models/product3D_model.dart';

import '../../domain/entities/product.dart';

class ProductModel extends Product {
  const ProductModel(
      {
      required super.category,  
      required super.id,  
      required super.name,
      required super.description,
      required super.price,
      required super.quantity,
      required super.subCategory,
      required super.image,
      required super.image3D,
      required super.dimensions,
      required super.provider
});

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(id: json['_id'],category: json['category'],
      name: json['name'], description: json['description'], price: double.parse(json['price'].toString()) , quantity: json['quantity'],subCategory: json['subCategory'],
      image: json['image'],image3D: (json['image3DInfo'] as List).map((e) => Product3DModel.fromJson(e)).toList(),
      provider: json['fournisseur'],dimensions: json['dimensions'] );

  Map<String, dynamic> toJson() => {
        '_id':id,
        'category':category,
        'name': name,
        'description': description,
        'price': price,
        'quantity': quantity,
        'subCategory':subCategory,
        'image':image,
        'image3D':image3D
      };
}
