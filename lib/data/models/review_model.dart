import 'package:instar/domain/entities/review.dart';

class ReviewModel extends Review {
  const ReviewModel(
      {required super.userID,
      required super.userName,
      required super.userImage,
      required super.productID,
      required super.rating,
      required super.comment,
      required super.image,
      required super.id});

  factory ReviewModel.fromJson(Map<String, dynamic> json) => ReviewModel(
      userID: json['user']['_id'],
      userName:json['user']['Firstname']+' '+json['user']['Lastname'],
      userImage: "userImage.png",
      productID: json['product'],
      rating: json['rating'],
      comment: json['comment'],
      image: json['image']??'',
      id: json['_id']);

  Map<String, dynamic> toJson() => {
        '_id': id,
        'user': userID,
        'product':productID,
        'rating':rating,
        'comment':comment,
        'image':image
      };
}
