import 'package:instar/domain/entities/user.dart';

class UserModel extends User {
  const UserModel(
      {required super.firstName,
      required super.lastName,
      required super.email,
      required super.phone,
      required super.password,  super.id, required super.ban, required super.role});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
      id: json['id'],
      ban: json['ban'],
      role: json['role'],
      firstName: json['Firstname'],
      lastName: json['Lastname'],
      email: json['email'],
      phone: json['phone'],
      password: json['password'],);

  Map<String, dynamic> toJson() => {
    'Firstname': firstName,
    'Lastname': lastName,
    'email': email,
    'phone': phone,
    'password': password,
    'ban':ban,
    'role':role,
    
  };
}
