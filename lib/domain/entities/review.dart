import 'package:equatable/equatable.dart';
import 'package:instar/domain/entities/user.dart';

import '../../presentation/UI/screens/products/product_static_list.dart';

class Review extends Equatable {
  final User user;
  final Product product;
  final int rating;
  final String comment;
  final String image;

  const Review(
      {required this.user,
      required this.product,
      required this.rating,
      required this.comment,
      required this.image});

  @override
  List<Object?> get props => [user, product, rating, comment, image];
}
