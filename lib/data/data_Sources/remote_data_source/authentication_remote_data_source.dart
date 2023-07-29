import 'package:instar/core/constant/api_const.dart';
import 'package:instar/data/models/user_model.dart';
import 'package:instar/domain/entities/user.dart';
import 'package:dio/dio.dart';

import '../../../core/errors/exceptions/exceptions.dart';

abstract class AuthenticationRemoteDataSource {
  Future<void> createAccount(User user);
  Future<User> login(String email, String password);
}

class AuthenticationRemoteDataSourceImpl
    implements AuthenticationRemoteDataSource {
  final dio = Dio();

  @override
  Future<void> createAccount(User user) async {
    try {
      UserModel userModel = UserModel(
          firstName: user.firstName,
          lastName: user.lastName,
          email: user.email,
          phone: user.phone,
          password: user.password);
      final response =
          await dio.post(ApiConst.register, data: userModel.toJson());
      if (response.statusCode == 200) {
        print('user added');
      }
    } catch (e) {
      throw RegistrationException();
    }
  }

  @override
  Future<User> login(String email, String password) async {
    /*  try {
      Map<String, dynamic> user = {email: email, password: password};

      final response =
          await dio.post(ApiConst.login, data:user);
      if (response.statusCode == 200) {
        print('user logged in');
      }
    } catch (e) {
      throw LoginException();
    }*/
    throw UnimplementedError();
  }
}
