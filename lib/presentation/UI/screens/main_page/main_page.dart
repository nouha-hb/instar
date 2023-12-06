import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:instar/core/style/assets.dart';
import 'package:instar/core/style/text_style.dart';
import 'package:instar/presentation/UI/screens/order_tracking/order_tracking.dart';
import 'package:instar/presentation/UI/screens/settings/settings.dart';
import 'package:instar/presentation/UI/screens/splash_screen/splash_screen.dart';
import 'package:instar/presentation/UI/screens/commands/commands_screen.dart';

import 'package:instar/presentation/state_managment/controllers/profile_controller.dart';
import '../../../../core/style/colors.dart';
import '../../../../di.dart';
import '../../../../domain/usecases/authentication_usecases/get_user_usecase.dart';
import '../../../state_managment/controllers/main_page_controller.dart';

class MainPage extends StatelessWidget {
  const MainPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
        init: MainController(),
        initState: (_) {},
        builder: (controller) {
          return Scaffold(
              backgroundColor: AppColors.bgColor,
              appBar: AppBar(
                elevation: 0,
                backgroundColor: AppColors.white,
                foregroundColor: AppColors.black,
                title: Text(
                  controller.pages[controller.currentIndex]["name"].toString(),
                  style: AppTextStyle.elementNameTextStyle,
                ),
                centerTitle: true,
              ),
              drawer: Drawer(
                child: FutureBuilder(
                    future: GetUserUsecase(sl())
                        .call(SplashScreen.userToken.userId),
                    builder: (_, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                            child: SizedBox(
                                width: 50.w,
                                height: 50.h,
                                child: const CircularProgressIndicator()));
                      } else if (snapshot.hasData) {
                        final res = snapshot.data;
                        res!.fold((l) {
                          return Center(child: Text(l.message.toString()));
                          print("drawer left");
                        }, (r) {
                          print("drawer right");

                          return const Text("drawer right fold");
                        });
                      }
                      return ListView(
                        // Important: Remove any padding from the ListView.
                        padding: EdgeInsets.zero,
                        children: [
                          UserAccountsDrawerHeader(
                            // <-- SEE HERE
                            decoration:
                                const BoxDecoration(color: AppColors.white),
                            accountName: Text(
                              "Hi👋 ${ProfileController.name}",
                              style: AppTextStyle.elementNameTextStyle,
                            ),
                            accountEmail: Text(
                              SplashScreen.currentUser.email,
                              style: AppTextStyle.elementNameTextStyle,
                            ),
                          ),
                          ListTile(
                            leading: Container(
                              width: 30.w,
                              height: 30.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.r),
                                  border: Border.all(color: AppColors.primary)),
                              child: Image.asset(Assets.home),
                            ),
                            title: Text(
                              'Acceuil',
                              style: AppTextStyle.elementNameTextStyle16,
                            ),
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                          ListTile(
                            leading: Container(
                              width: 30.w,
                              height: 30.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.r),
                                  border: Border.all(color: AppColors.primary)),
                              child: Image.asset(Assets.marques),
                            ),
                            title: Text(
                              'mes commandes',
                              style: AppTextStyle.elementNameTextStyle16,
                            ),
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => const CommandsScreen()));
                            },
                          ),
                          ListTile(
                            leading: Container(
                              width: 30.w,
                              height: 30.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.r),
                                  border: Border.all(color: AppColors.primary)),
                              child: Image.asset(Assets.settings),
                            ),
                            title: Text('Paramétres',
                                style: AppTextStyle.elementNameTextStyle16),
                            onTap: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Settings(),
                                  ));
                            },
                          ),
                        ],
                      );
                    }),
              ),
              bottomNavigationBar: BottomAppBar(
                child: Container(
                    width: MediaQuery.sizeOf(context).width,
                    height: 65.h,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black38,
                            spreadRadius: 0,
                            blurRadius: 20.r),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25.0.r),
                        topRight: Radius.circular(25.0.r),
                      ),
                      child: BottomNavigationBar(
                        type: BottomNavigationBarType.fixed,
                        currentIndex: controller.currentIndex,
                        onTap: controller.onTap,
                        selectedItemColor: AppColors.primary,
                        unselectedItemColor: AppColors.grey,
                        showSelectedLabels: false,
                        showUnselectedLabels: false,
                        items: [
                          BottomNavigationBarItem(
                            icon: Icon(
                              Icons.home_outlined,
                              size: 30.sp,
                            ),
                            label: 'Acceuil',
                          ),
                          BottomNavigationBarItem(
                              icon: Icon(
                                Icons.apps,
                                size: 30.sp,
                              ),
                              label: 'Catégoies'),
                          BottomNavigationBarItem(
                              icon: Icon(
                                Icons.shopping_cart_outlined,
                                size: 30.sp,
                              ),
                              label: 'Panier'),
                          BottomNavigationBarItem(
                              icon: Icon(
                                Icons.favorite_border,
                                size: 30.sp,
                              ),
                              label: 'favorite'),
                          BottomNavigationBarItem(
                              icon: Icon(
                                Icons.person,
                                size: 30.sp,
                              ),
                              label: 'person')
                        ],
                      ),
                    )),
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    // SheetAppBar(text:controller.pages[controller.currentIndex]["name"].toString()),
                    controller.pages[controller.currentIndex]['page'] as Widget,
                  ],
                ),
              ));
        });
  }
}
