import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:instar/core/constant/api_const.dart';
import 'package:instar/data/models/token_model.dart';
import 'package:instar/data/models/user_model.dart';
import 'package:instar/domain/entities/user.dart';
import 'package:dio/dio.dart';

import '../../../core/errors/exceptions/exceptions.dart';

abstract class AuthenticationRemoteDataSource {
  Future<String> createAccount(User user);
  Future<TokenModel> login(String email, String password);
  Future<TokenModel> googleLogin();
  Future<TokenModel> facebookLogin();
  Future<User> getcurrentUser(String id);
  Future<void> updateProfil(User user);
}

class AuthenticationRemoteDataSourceImpl
    implements AuthenticationRemoteDataSource {
  final dio = Dio();

  @override
  Future<String> createAccount(User user) async {
    try {
      UserModel userModel = UserModel(
          id: '',
          role: user.role,
          firstName: user.firstName,
          lastName: user.lastName,
          email: user.email,
          phone: user.phone,
          password: user.password,
          ban: user.ban);
      final res = await dio.post(ApiConst.register, data: userModel.toJson());
      return res.data["uId"];
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
      print(data);
      return token;
    } catch (e) {
      print('server error');
      throw LoginException(msg);
    }
  }

//not completed
  @override
  Future<TokenModel> googleLogin() async {
    TokenModel token;
    try {
      final googleSignIN = GoogleSignIn();
      final user = await googleSignIN.signIn();
      if (user != null) {
        final _name = user!.displayName!.split(' ');
        final _email = user.email;
        final _id = user.id;
        final usr = UserModel(
            firstName: _name[0],
            lastName: _name[1],
            email: _email,
            phone: '',
            password: '123',
            ban: false,
            role: 'user',
            id: _id);
        try {
          token = await login(_email, '123');
        } catch (e) {
          await createAccount(usr);
          token = await login(_email, '123');
        }
        googleSignIN.signOut;
        await googleSignIN.disconnect();
        return token;
      } else {
        print("error");
        throw LoginException("Login failure");
      }
    } on LocalStorageException {
      rethrow;
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<User> getcurrentUser(String id) async {
    try {
      final _response = await dio.post(ApiConst.getProfile, data: {"_id": id});
      print("current userrrr" + _response.data.toString());
      return UserModel.fromJson(_response.data['user']);
    } catch (e) {
      throw ServerException(message: 'User not Found');
    }
  }

  @override
  Future<void> updateProfil(User user) async {
    try {
      UserModel model = UserModel(
          firstName: user.firstName,
          lastName: user.lastName,
          email: user.email,
          phone: user.phone,
          password: user.password,
          ban: user.ban,
          role: user.role);
      await dio.post(ApiConst.updateProfil, data: model.toJson());
    } catch (e) {
      throw ServerException(message: 'cannot update profile');
    }
  }

  @override
  Future<TokenModel> facebookLogin() async {
    TokenModel token;
    try {
      final LoginResult result = await FacebookAuth.instance.login();
      if (result.status == LoginStatus.success) {
        final _accessToken = result.accessToken;
        final userData = await FacebookAuth.instance.getUserData();
        print('user data ${userData.toString()}');
        final _name = userData['name'].split(' ');
        final _id = userData['id'];
        final usr = UserModel(
            firstName: _name[0],
            lastName: _name[1],
            email: _id.toString(),
            phone: '',
            password: '123',
            ban: false,
            role: 'user',
            id: _id);
        try {
          token = await login(_id, '123');
        } catch (e) {
          await createAccount(usr);
          token = await login(_id, '123');
        }
        await FacebookAuth.instance.logOut();
        return token;
      } else {
        throw LoginException("Login failure");
      }
    } on LocalStorageException {
      rethrow;
    } catch (e) {
      throw ServerException();
    }
  }
}
