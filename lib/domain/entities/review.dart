import 'package:equatable/equatable.dart';
import 'package:instar/domain/entities/user.dart';

import '../../presentation/UI/screens/products/product_static_list.dart';

class Review extends Equatable {
  final String? id;
  final String userID;
  final String productID;
  final int rating;
  final String comment;
  final String? image;

  const Review(
      {required this.id,
      required this.userID,
      required this.productID,
      required this.rating,
      required this.comment,
      required this.image});

  @override
  List<Object?> get props => [userID, productID, rating, comment, image,id];
}
