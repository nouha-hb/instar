
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

      required super.dimensions,
      required super.provider,
      required super.reference
});

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(id: json['_id'],category: json['category'],reference: json['reference'],
      name: json['name'], description: json['description'], price: double.parse(json['price'].toString()) , quantity: json['quantity'],subCategory: json['subCategory'],
      image: json['image'],
      provider: json['fournisseur'],dimensions: json['dimensions'] );

  Map<String, dynamic> toJson() => {
        '_id':id,
        'reference':reference,
        'category':category,
        'name': name,
        'description': description,
        'price': price,
        'quantity': quantity,
        'subCategory':subCategory,
        'image':image,
      };
}