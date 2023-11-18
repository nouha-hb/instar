import 'package:instar/domain/entities/sales.dart';

class SalesModel extends Sales{
 const SalesModel({ super.id,required super.productId,required super.providerId,required super.userId,required super.quantity,required super.status,required super.totalPrice});
  factory SalesModel.fromJson(Map<String,dynamic>json)=>SalesModel(
    id:json['_id'],
   productId:json['productId'],
   providerId: json['fournisseurId'],
    userId:json['UserId'],
     quantity:json['quantity'], 
     status:json['status'],
      totalPrice:double.parse(json['price'].toString()));

   Map<String,dynamic> toJson()=>{
    'productId':productId,
    'fournisseurId':providerId,
    'UserId':userId,
    'quantity':quantity,
    'status':status,
    'price':totalPrice
   };   
}