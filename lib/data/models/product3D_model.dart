import 'package:instar/domain/entities/Product3D.dart';

// ignore: must_be_immutable
class Product3DModel extends Product3D {
   Product3DModel({required super.model3D, required super.texture,required super.quantity, required super.id});

  factory Product3DModel.fromJson(Map<String, dynamic> json) =>
      Product3DModel(model3D: json['image3D'], texture: json['imageCouleurs'],quantity:json['quantity'] ,id:json['_id']);
  
}
