import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:instar/presentation/UI/widgets/sheet_app_bar.dart';

import '../../../../core/style/colors.dart';
import '../../../state_managment/controllers/main_page_controller.dart';

class MainPage extends StatelessWidget {
  const MainPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
        init: MainController(),
        initState: (_) {},
        builder: (controller) {
   
          return Scaffold(
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
                                Icons.favorite,
                                size: 30.sp,
                              ),
                              label: 'favorite')
                        ],
                      ),
                    )),
              ),
               
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    SheetAppBar(text:controller.pages[controller.currentIndex]["name"].toString()),
                  controller.pages[controller.currentIndex]['page'] as Widget,
                  ],
                ),
              ));
        });
  }
}
