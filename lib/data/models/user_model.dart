import 'package:instar/domain/entities/user.dart';

class UserModel extends User {
  const UserModel(
      {required super.firstName,
      required super.lastName,
      required super.email,
      required super.phone,
      required super.password});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
      firstName: json['Firstname'],
      lastName: json['Lastname'],
      email: json['email'],
      phone: json['phone'],
      password: json['password']);

  Map<String, dynamic> toJson() => {
    'Firstname': firstName,
    'Lastname': lastName,
    'email': email,
    'phone': phone,
    'password': password
  };
}
