import 'package:equatable/equatable.dart';

class Fournisseur extends Equatable {
  final String name;
  final String address;
  final num phone;
  

  const Fournisseur({
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
