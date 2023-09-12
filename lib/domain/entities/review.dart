import 'package:equatable/equatable.dart';
import 'package:instar/domain/entities/user.dart';

import '../../presentation/UI/screens/products/product_static_list.dart';

class Review extends Equatable {
  final String? id;
  final String userID;
  final String? userName;
  final String? userImage;
  final String productID;
   String comment;
   String? image;
  final DateTime? date;

   Review(
      {required this.id,
      this.userName,
      this.userImage,
      this.date,
      required this.userID,
      required this.productID,
      required this.comment,
       this.image});

  @override
  List<Object?> get props =>
      [userID, productID, comment, image, id, userImage, userName, date];
}
