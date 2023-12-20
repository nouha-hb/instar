import 'package:equatable/equatable.dart';

class Sales extends Equatable{
  final String? id;
  final String productId;
  final String providerId;
  final String userId;
   int quantity;
  final String status;
   double totalPrice;

   Sales({ this.id,required this.productId,required this.providerId,required this.userId,required this.quantity,required this.status,required this.totalPrice});
  
  @override
  List<Object?> get props => [id,productId,providerId,userId,quantity,status,totalPrice];


}