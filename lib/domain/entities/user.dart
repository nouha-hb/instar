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
  final int number;

  const User(
      {
     this.id,
      required this.ban,
      required this.number,
      required this.role,  
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.phone,
      required this.password});

  @override
  List<Object?> get props => [firstName,lastName,email,phone,password,ban,id,number,role];

}

