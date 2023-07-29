import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:instar/domain/entities/user.dart';
import 'package:instar/domain/usecases/create_account_usecase.dart';
import 'package:instar/presentation/UI/screens/sign_in/sign_in_screen.dart';
import 'package:instar/presentation/UI/screens/sign_up/sign_up_screen.dart';
import 'di.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  final res = await CreateAccountUsecase(di.sl()).call(const User(firstName: "yassine", lastName: "ajroud", email: "email@gmail.com", phone: "123", password: "1234"));
  res.fold((l) => {print('left data')}, (r) => print('right data'));
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
