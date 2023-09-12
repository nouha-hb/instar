import 'package:equatable/equatable.dart';

class Rating extends Equatable {
  final String id;
  final String userId;
  final String productId;
  int rating;

  Rating({required this.id, required this.userId, required this.productId,required this.rating});

  @override
  List<Object?> get props => [id,userId,productId,rating];
}
