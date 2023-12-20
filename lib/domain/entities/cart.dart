import 'package:equatable/equatable.dart';
import 'package:instar/domain/entities/sales.dart';

// ignore: must_be_immutable
class Cart extends Equatable{
    final String id;
  final String userId;
  List<Sales> sales;

   Cart({required this.id, required this.userId, required this.sales});

  @override
  List<Object?> get props => [id, userId, sales];
}