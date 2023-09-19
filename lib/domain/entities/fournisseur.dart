import 'package:equatable/equatable.dart';

class Fournisseur extends Equatable {
  final String name;
  String address;
  final num phone;

  Fournisseur({
    required this.name,
    required this.address,
    required this.phone,
  });

  @override
  List<Object?> get props => [
        name,
        address,
        phone,
      ];
}
