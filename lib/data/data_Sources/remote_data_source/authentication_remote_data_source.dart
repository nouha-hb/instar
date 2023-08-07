import 'dart:convert';

import 'package:google_sign_in/google_sign_in.dart';
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
  Future<TokenModel> googleLogin();

}

class AuthenticationRemoteDataSourceImpl
    implements AuthenticationRemoteDataSource {
  //final _tk=Authentication.remoteDa    
  final dio = Dio();
 // dio.options.headers['content-Type'] = 'application/json';
  //dio.options.headers["authorization"] = "";

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
      msg = data['message'];

      final TokenModel token = TokenModel.fromJson(data);
      return token;
    } catch (e) {
      print(msg);
      throw LoginException(msg);
    }
  }


//not completed
  @override
  Future<TokenModel> googleLogin() {
    final _googleSignIN = GoogleSignIn();
    _googleSignIN.signIn();
    throw UnimplementedError();
  }
  

}
