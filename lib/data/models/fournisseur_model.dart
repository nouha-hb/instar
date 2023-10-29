import '../../domain/entities/fournisseur.dart';

class FournisseurModel extends Fournisseur {
  FournisseurModel(
      {required super.name,
      required super.address,
      required super.phone,
      required super.image});
  factory FournisseurModel.fromJson(Map<String, dynamic> json) =>
      FournisseurModel(
          name: json['name'],
          address: json['address'],
          phone: json['phone'],
          image: json['image']);

  Map<String, dynamic> toJson() =>
      {'name': name, 'address': address, 'phone': phone, 'image': image};
}
