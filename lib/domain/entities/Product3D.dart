import 'package:equatable/equatable.dart';

class Product3D extends Equatable {
   String model3D;
   String texture;
   int quantity;
  final String id;

   Product3D(
      {required this.model3D, required this.texture, required this.quantity,required this.id});

  @override
  List<Object?> get props => [model3D, texture, quantity,id];
}
