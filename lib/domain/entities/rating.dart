import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Rating extends Equatable {
  final String? id;
  final String userId;
  final String productId;
  int rating;

  Rating({ this.id, required this.userId, required this.productId,required this.rating});

  @override
  List<Object?> get props => [id,userId,productId,rating];
}
