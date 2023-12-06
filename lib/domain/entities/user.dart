import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String? id;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String password;
  final bool ban;
  final String role;

  const User(
      {
     this.id,
      required this.ban,
      required this.role,  
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.phone,
      required this.password});

  @override
  List<Object?> get props => [firstName,lastName,email,phone,password,ban,id,role];

}
