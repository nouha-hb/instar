import 'dart:convert';

import 'package:instar/core/constant/string_const.dart';
import 'package:instar/core/errors/exceptions/exceptions.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/token_model.dart';

abstract class AuthenticationLocalDataSource {
  Future<void> saveUserInformations(TokenModel token);
  Future<TokenModel> getUserInformations();
  Future<void> logout();
  Future<bool> autoLogin();
}

class AuthenticationLocalDataSourceImpl
    implements AuthenticationLocalDataSource {
  @override
  Future<void> saveUserInformations(TokenModel token) async {
    try {
      final sp = await SharedPreferences.getInstance();
      print('sp $token');
      sp.setString(StringConst.SP_TOKEN_KEY, json.encode(token.toJson()));
    } catch (e) {
      throw LocalStorageException();
    }
  }

  @override
  Future<TokenModel> getUserInformations() async {
    try {
      final sp = await SharedPreferences.getInstance();
      final data = sp.getString(StringConst.SP_TOKEN_KEY);
      TokenModel token = TokenModel.fromJson(json.decode(data.toString()));
      return token;
    } catch (e) {
      throw LocalStorageException();
    }
  }

  @override
  Future<void> logout() async {
    try {
      final sp = await SharedPreferences.getInstance();
      sp.setString(StringConst.SP_TOKEN_KEY, '');
    } catch (e) {
      throw LocalStorageException();
    }
  }

  @override
  Future<bool> autoLogin() async {
    try {
      TokenModel token = await getUserInformations();
      print('login info ${token.toString()}');
      if (token.expiryDate.isAfter(DateTime.now())) {
        await logout();
        return false;
      } else {
        return true;
      }
    } catch (e) {
      throw LocalStorageException();
    }
  }
}
