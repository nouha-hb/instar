import 'package:equatable/equatable.dart';

class Fournisseur extends Equatable {
  final String name;
  final String address;
  final num phone;
  final  String image;

  const Fournisseur({
    required this.name,
    required this.address,
    required this.phone,
    required this.image,
  });

  @override
  List<Object?> get props => [
        name,
        address,
        phone,
        image
      ];
}
