import 'package:equatable/equatable.dart';

class Paiement extends Equatable {
  final String Nom;
  final String Code;
  final String DateExp;
  final String CVV;
  

  const Paiement(
 { 
    required this.Nom,
 required this.Code,
 required this.DateExp,
 required this.CVV}
    );

  @override
  List<Object?> get props => [Nom,Code,DateExp,CVV,];
}