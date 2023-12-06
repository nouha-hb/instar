import 'package:equatable/equatable.dart';

class SubCategory extends Equatable {
  final String name;

  

  const SubCategory(
 { 
    required this.name,
}
    );

  @override
  List<Object?> get props => [name];
}