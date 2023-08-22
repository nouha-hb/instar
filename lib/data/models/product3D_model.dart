import 'package:instar/domain/entities/Product3D.dart';

class Product3DModel extends Product3D {
  const Product3DModel({required super.model3D, required super.texture});

  factory Product3DModel.fromJson(Map<String, dynamic> json) =>
      Product3DModel(model3D: json['image3D'], texture: json['imageCouleurs']);
  
}
