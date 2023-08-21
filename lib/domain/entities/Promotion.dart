import 'package:equatable/equatable.dart';
import 'package:instar/domain/entities/product.dart';

class Promotion extends Equatable {
  final String id;
  final Product product;
  final int discount;
  final DateTime startDate;
  final DateTime endDate;
  final String image;

  const Promotion(
      {
      required this.id, 
      required this.product,
      required this.discount,
      required this.startDate,
      required this.endDate,
      required this.image});

  @override
  List<Object?> get props => [id,product, discount, startDate, endDate, image];
}
