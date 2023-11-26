import 'package:instar/data/models/product_model.dart';
import 'package:instar/domain/entities/Promotion.dart';

class PromotionModel extends Promotion {
  const PromotionModel({
    required super.id,
    required super.product,
    required super.discount,
    required super.startDate,
    required super.endDate,
  });

  factory PromotionModel.fromJson(Map<String, dynamic> json) => PromotionModel(
        id: json['_id'],
        product: ProductModel.fromJson(json['product']),
        discount: json['discountPercentage'],
        startDate: DateTime.parse(json['startDate']),
        endDate: DateTime.parse(json['endDate']),
      );
}
