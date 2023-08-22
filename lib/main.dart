import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:instar/core/l10n/l10n.dart';
import 'package:instar/domain/usecases/authentication_usecases/auto_login_usecase.dart';
import 'package:instar/domain/usecases/authentication_usecases/login_usecase.dart';
import 'package:instar/domain/usecases/authentication_usecases/logout_usecase.dart';
import 'package:instar/presentation/UI/screens/landing_screen/landing_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:instar/presentation/UI/screens/main_page/profile_page.dart';
import 'package:instar/presentation/UI/screens/profil.dart';
import 'package:instar/presentation/UI/screens/main_page/main_page.dart';
import 'package:instar/presentation/UI/screens/prod.dart';
import 'package:instar/presentation/UI/screens/settings/language_settings.dart';
import 'package:instar/presentation/UI/screens/settings/settings.dart';
import 'package:instar/presentation/UI/screens/sign_in/sign_in_screen.dart';
import 'package:instar/presentation/UI/screens/splash_screen/splash_screen.dart';
import 'package:instar/presentation/state_managment/settings_controller.dart';
import 'package:provider/provider.dart';
import 'package:instar/presentation/UI/screens/landing_screen/landing_screen.dart';
import 'package:instar/presentation/UI/screens/main_page/home_page.dart';
import 'package:instar/presentation/UI/screens/main_page/main_page.dart';
import 'package:instar/presentation/UI/screens/paiement/detail_paiement.dart';
import 'package:instar/presentation/UI/screens/paiement/paiement.dart';

import 'di.dart' as di;
import 'di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  print(DateTime.parse("2023-08-16 17:29:21").isAfter(DateTime.now()));
  runApp(ChangeNotifierProvider(
    create: (_) => SettingsController(),
    child: MyApp(),
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
        locale: Provider.of<SettingsController>(context).locale ??
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
        child: Text('ed'),
        onPressed: () async {
           await LogoutUsecase(sl()).call();
           // await LoginUsecase(sl()).call(email: 'emafghil', password: '1234');
          final res = await AutoLoginUsecase(sl()).call();
          res.fold((l) {
            print(l.toString()+"error *********");
            return Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => SignIn()));
          }, (r) {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => MainPage()));
          });
        },
      ),
    );
  }
}
