

import '../../domain/entities/paiement.dart';

class PaiementModel extends Paiement {

  const PaiementModel(
 { 
    required super.Nom,
 required super.Code,
 required super.DateExp,
 required super.CVV}
    );

  factory PaiementModel.fromJson(Map<String, dynamic> json) => PaiementModel(
      Nom: json['Nom'],
      Code: json['Code'],
      DateExp: json['DateExp'],
      CVV: json['CVV'],
     
      );

  Map<String, dynamic> toJson() => {
    'Nom': Nom,
    'Code': Code,
    'DateExp': DateExp,
    'CVV': CVV,

  };
}
