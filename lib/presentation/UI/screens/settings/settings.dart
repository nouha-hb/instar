import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instar/core/style/colors.dart';
import 'package:instar/core/style/text_style.dart';
import 'package:instar/presentation/UI/screens/main_page/main_page.dart';
import 'package:instar/presentation/UI/screens/settings/language_settings.dart';
import 'package:instar/presentation/UI/widgets/settings_component.dart';

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
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("name"),
                          Text("email"),
                        ],
                      ),
                    ],
                  ),
                  IconButton(
                      onPressed: () {}, icon: Icon(Icons.arrow_forward_ios_sharp))
                ],
              ),
            ),
             SizedBox(
                        height: 20.w,
                      ),
            InkWell(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SelectLanguageScreent(),)),
              child: SettingComponent(
                  text: "Languages", iconData: Icons.wifi_tethering, width: 300.w, height: 60.h),
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
