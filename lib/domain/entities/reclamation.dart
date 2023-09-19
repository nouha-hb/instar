import 'package:equatable/equatable.dart';

class Reclamation extends Equatable {
  final String? id;
  final String user;
  final String product;
  final String description;
  final String status;


 const Reclamation({this.id, required this.user, required this.product, required this.description, required this.status});
 
  @override
  List<Object?> get props =>[id,user,product,description,status];
  
}
