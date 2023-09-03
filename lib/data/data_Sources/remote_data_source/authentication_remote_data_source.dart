import 'dart:convert';

import 'package:instar/core/constant/api_const.dart';
import 'package:instar/data/models/token_model.dart';
import 'package:instar/data/models/user_model.dart';
import 'package:instar/domain/entities/token.dart';
import 'package:instar/domain/entities/user.dart';
import 'package:dio/dio.dart';

import '../../../core/errors/exceptions/exceptions.dart';

abstract class AuthenticationRemoteDataSource {
  Future<void> createAccount(User user);
  Future<TokenModel> login(String email, String password);
    Future<void> ForgetPassword(User user);
     Future<void> VerifCode(User user);
      Future<void> Resetpassword(User user);
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
      await dio.post(ApiConst.register, data: userModel.toJson());
    } catch (e) {
      throw RegistrationException();
    }
  }

  @override
  Future<TokenModel> login(String email, String password) async {
    String msg = '';
    try {
      Map<String, dynamic> user = {'username': email, 'password': password};
      final response = await dio.post(ApiConst.login, data: user);

      final data = response.data;
      msg =data['message'];


      final TokenModel token = TokenModel.fromJson(data);
      return token;
    } catch (e) {
      print(msg);
      throw LoginException(msg);
    }
  }
  
  @override
  Future<void> ForgetPassword(User user) async {
     try {
      UserModel userModel = UserModel(
          firstName: user.firstName,
          lastName: user.lastName,
          email: user.email,
          phone: user.phone,
          password: user.password);
      await dio.post(ApiConst.register, data: userModel.toJson());
    } catch (e) {
      throw ForgetPasswordException();
    }
  }
  
  @override
  Future<void> Resetpassword(User user) async {
    // TODO: implement Resetpassword
    try {
      UserModel userModel = UserModel(
          firstName: user.firstName,
          lastName: user.lastName,
          email: user.email,
          phone: user.phone,
          password: user.password);
      await dio.post(ApiConst.register, data: userModel.toJson());
    } catch (e) {
      throw RegistrationException();
    }
  }
  
  @override
  Future<void> VerifCode(User user) async {
    // TODO: implement VerifCode
      try {
      UserModel userModel = UserModel(
          firstName: user.firstName,
          lastName: user.lastName,
          email: user.email,
          phone: user.phone,
          password: user.password);
      await dio.post(ApiConst.register, data: userModel.toJson());
    } catch (e) {
      throw RegistrationException();
    }
  }
}
