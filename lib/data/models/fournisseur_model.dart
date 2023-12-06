import '../../domain/entities/fournisseur.dart';

class FournisseurModel extends Fournisseur {
  const FournisseurModel({
    required super.id,
    required super.name,
        required super.address,
    required super.userID,
    required super.phone,
  });
  factory FournisseurModel.fromJson(Map<String, dynamic> json) =>
      FournisseurModel(
        id: json['_id'],
        name: json['name'],
        address: json['address'],
        phone: json['phone'],
        userID: json['userID']


      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'address': address,
        'phone': phone,
        'userId':userID
      };
}
