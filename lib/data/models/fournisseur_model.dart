import '../../domain/entities/fournisseur.dart';

class FournisseurModel extends Fournisseur {
  FournisseurModel({
    required super.name,
        required super.address,

    required super.phone,
  });
  factory FournisseurModel.fromJson(Map<String, dynamic> json) =>
      FournisseurModel(
        name: json['name'],
        address: json['address'],
        phone: json['phone'],

      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'address': address,
        'phone': phone,
      };
}
