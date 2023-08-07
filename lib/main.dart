import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:instar/domain/entities/user.dart';
import 'package:instar/domain/usecases/authentication_usecases/login_usecase.dart';
import 'package:instar/presentation/UI/screens/sign_in/sign_in_screen.dart';
import 'package:instar/presentation/UI/screens/sign_up/sign_up_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/constant/string_const.dart';
import 'data/models/token_model.dart';
import 'di.dart' as di;
import 'di.dart';
import 'domain/usecases/authentication_usecases/create_account_usecase.dart';
import 'domain/usecases/authentication_usecases/google_login_usecase.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  // final res = await CreateAccountUsecase(di.sl()).call(const User(firstName: "yassine", lastName: "ajroud", email: "email@gmail.com", phone: "123", password: "1234"));
  // res.fold((l) => {print('left data')}, (r) => print('right data'));

  // final res =
  //     await LoginUsecase(di.sl()).call(email: "emafghil", password: "1234");
  // res.fold((l) => {print(l.message)}, (r) => print('user logged in'));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (_, __) => const GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: SignIn(),

        // home: ConventionSignee(),
      ),
    );
  }
}





/*
class Google extends StatelessWidget {
  const Google({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:ElevatedButton(onPressed: ()async{                              await GoogleLoginUsecase(sl()).call();
},child: Text('google'),)
      ),
    );
  }
}

class Facebook extends StatefulWidget {
  const Facebook({super.key});

  @override
  State<Facebook> createState() => _FacebookState();
}

class _FacebookState extends State<Facebook> {
  Map<String, dynamic>? _userData;
  AccessToken? _accessToken;
  bool _checking = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _checkIfisLoggedIn();
  }

  _checkIfisLoggedIn() async {
    final accessToken = await FacebookAuth.instance.accessToken;

    setState(() {
      _checking = false;
    });
    //print('token = ${accessToken!.toJson()}');
    if (accessToken != null) {
      print(accessToken.toJson());
      final userData = await FacebookAuth.instance.getUserData();
       print('id = ${userData["id"]}');
      _accessToken = accessToken;
      setState(() {
        _userData = userData;
      });
    } else {
      _login();
    }
  }

  _login() async {
    final LoginResult result = await FacebookAuth.instance.login();

    if (result.status == LoginStatus.success) {
      _accessToken = result.accessToken;
      final userData = await FacebookAuth.instance.getUserData();
      _userData = userData;
    } else {
      print(result.status);
      print(result.message);
    }
    setState(() {
      _checking = false;
    });
  }

  _logout() async {
    await FacebookAuth.instance.logOut();
    _accessToken = null;
    _userData = null;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    print(_userData);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Facebook Auth Project')),
        body: _checking
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Center(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _userData != null
                      ? Text('name: ${_userData!['name']}')
                      : Container(),
                  _userData != null
                      ? Text('email: ${_userData!['email']}')
                      : Container(),
                  _userData != null
                      ? Container(
                          child: Image.network(
                              _userData!['picture']['data']['url']),
                        )
                      : Container(),
                  SizedBox(
                    height: 20,
                  ),
                  CupertinoButton(
                      color: Colors.blue,
                      child: Text(
                        _userData != null ? 'LOGOUT' : 'LOGIN',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: _userData != null ? _logout : _login)
                ],
              )),
      ),
    );
  }
}
*/