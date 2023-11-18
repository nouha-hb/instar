import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instar/core/l10n/l10n.dart';
import 'package:instar/domain/usecases/authentication_usecases/auto_login_usecase.dart';
import 'package:instar/domain/usecases/authentication_usecases/logout_usecase.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:instar/presentation/UI/screens/admin/admin_home_screen.dart';
import 'package:instar/presentation/UI/screens/main_page/main_page.dart';
import 'package:instar/presentation/UI/screens/sign_in/sign_in_screen.dart';
import 'package:instar/presentation/UI/screens/splash_screen/splash_screen.dart';
import 'package:instar/presentation/state_managment/controllers/settings_controller.dart';
import 'package:provider/provider.dart';

import 'di.dart' as di;
import 'di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(ChangeNotifierProvider(
    create: (_) => SettingsController(),
    child:const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool loggedin = false;
  // This widget is the root of your application.
  @override
  void initState() {
    Provider.of<SettingsController>(context, listen: false).loadLanguage();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (_, __) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
        supportedLocales: L10n.all,
        locale:  Provider.of<SettingsController>(context).locale ??
            const Locale('fr'),
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ElevatedButton(
        child:const Text('ed'),
        onPressed: () async {
          await LogoutUsecase(sl()).call();
          // await LoginUsecase(sl()).call(email: 'emafghil', password: '1234');
          final res = await AutoLoginUsecase(sl()).call();
          res.fold((l) {
            print(l.toString() + "error *********");
            return Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) =>const SignIn()));
          }, (r) {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) =>const MainPage()));
          });
        },
      ),
    );
  }
}
