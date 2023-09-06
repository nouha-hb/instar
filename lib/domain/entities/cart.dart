import 'package:equatable/equatable.dart';

class Cart extends Equatable{
    final String id;
  final String userId;
  List<String> productsId;

   Cart({required this.id, required this.userId, required this.productsId});

  @override
  List<Object?> get props => [id, userId, productsId];
}