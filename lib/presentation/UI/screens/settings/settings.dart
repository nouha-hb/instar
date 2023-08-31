import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instar/core/style/colors.dart';
import 'package:instar/core/style/text_style.dart';
import 'package:instar/presentation/UI/screens/main_page/main_page.dart';
import 'package:instar/presentation/UI/screens/main_page/profile_page.dart';
import 'package:instar/presentation/UI/screens/my_profile/edit_profile.dart';
import 'package:instar/presentation/UI/screens/settings/language_settings.dart';
import 'package:instar/presentation/UI/screens/splash_screen/splash_screen.dart';
import 'package:instar/presentation/UI/widgets/settings_component.dart';

import '../../../../di.dart';
import '../../../../domain/usecases/authentication_usecases/get_user_usecase.dart';
import '../../../state_managment/controllers/profile_controller.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MainPage(),
                  ));
            },
            icon: Icon(Icons.arrow_back_ios)),
        elevation: 0,
        backgroundColor: AppColors.white,
        foregroundColor: AppColors.black,
        title: Text(
          "Paramétres",
          style: AppTextStyle.elementNameTextStyle,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(children: [
            SizedBox(
              height: 20.w,
            ),
            Container(
              width: 300.w,
              height: 80.h,
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(15.r)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      FlutterLogo(
                        size: 40,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      FutureBuilder(
                          future: GetUserUsecase(sl())
                              .call(SplashScreen.userToken.userId),
                          builder: (_, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Center(
                                  child: SizedBox(
                                      width: 50.w,
                                      height: 50.h,
                                      child:
                                          const CircularProgressIndicator()));
                            } 
                            else if (snapshot.hasData) {
                              final res = snapshot.data;
                              print(res.toString());
                              res!.fold((l) {
                                return Center(
                                    child: Text(l.message.toString()));
                                print("setting left");
                              }, (r) {
                                print("right side ");

                                return Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.center,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Text(r.firstName.toString()),
                                    Text(r.email),
                                  ],
                                );
                              });
                            }
                            return Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.center,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Text(ProfileController.name),
                                    Text(ProfileController.lastName),
                                  ],
                                );;
                          }),
                    ],
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditProfile(),
                            ));
                      },
                      icon: Icon(Icons.arrow_forward_ios_sharp))
                ],
              ),
            ),
            SizedBox(
              height: 20.w,
            ),
            InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SelectLanguageScreen(),
                  )),
              child: SettingComponent(
                  text: "Languages",
                  iconData: Icons.wifi_tethering,
                  width: 300.w,
                  height: 60.h),
            ),
            SizedBox(
              height: 20.w,
            ),
            SettingComponent(
                text: "Notification",
                iconData: Icons.notifications,
                width: 300.w,
                height: 60.h),
            SizedBox(
              height: 20.w,
            ),
            SettingComponent(
                text: "help",
                iconData: Icons.help_center,
                width: 300.w,
                height: 60.h),
            SizedBox(
              height: 20.w,
            ),
            SettingComponent(
                text: "mode",
                iconData: Icons.night_shelter,
                width: 300.w,
                height: 60.h),
          ]),
        ),
      ),
    );
  }
}
