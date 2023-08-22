import 'package:equatable/equatable.dart';

class Product3D extends Equatable {
  final String model3D;
  final String texture;

  const Product3D({required this.model3D, required this.texture});

  @override
  List<Object?> get props => [model3D, texture];
}
