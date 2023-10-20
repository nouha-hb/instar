import 'package:instar/domain/entities/rating.dart';

// ignore: must_be_immutable
class RatingModel extends Rating {
  RatingModel(
      {required super.id,
      required super.userId,
      required super.productId,
      required super.rating});

  factory RatingModel.fromJson(Map<String, dynamic> json) => RatingModel(
      id: json['_id'],
      userId: json['user'],
      productId: json['product'],
      rating: json['rating']);

  Map<String, dynamic> toJson() => {
    'user':userId,
    'product':productId,
    'rating':rating
  };
}
