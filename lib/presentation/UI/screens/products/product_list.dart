import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:instar/core/style/colors.dart';
import 'package:instar/core/style/text_style.dart';
import 'package:instar/presentation/UI/screens/products/product_description.dart';
import 'package:instar/presentation/UI/screens/profile/profile_screen.dart';

import '../../../state_managment/controllers/product_list_controller.dart';
import 'package:anim_search_bar/anim_search_bar.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ProductListController>(
          init: ProductListController(),
          initState: (_) {},
          builder: (controller) {
            return Padding(
              padding: EdgeInsets.all(18.0.r),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            Get.to(Profile());
                          },
                          icon: Icon(
                            Icons.menu,
                            color: AppColors.black,
                            size: 30.sp,
                          )),
                      Text("Découvrir"),
                      Icon(
                        Icons.notifications_none_outlined,
                        color: AppColors.black,
                        size: 30.sp,
                      ),
                    ],
                  ),
                  AnimSearchBar(
                    width: 400,
                    textController: controller.textController,
                    rtl: true,
                    onSuffixTap: () {
                      // textController.clear();
                    },
                    onSubmitted: (String) {},
                  ),
                  SizedBox(height: 20.h),
                  const Text(
                    "Categories",
                    style: AppTextStyle.titleTextStyle,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 60.h,
                    child: ListView.builder(
                      itemCount: controller.categories.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              controller.selectedIndex = index;
                              controller.update();
                            },
                            child: Container(
                              height: 10,
                              decoration: BoxDecoration(
                                  color: controller.selectedIndex == index
                                      ? AppColors.black
                                      : AppColors.white,
                                  border: Border.all(color: AppColors.black),
                                  borderRadius: BorderRadius.circular(10.r)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                    child: Text(
                                  controller.categories[index],
                                  style: TextStyle(
                                    color: controller.selectedIndex == index
                                        ? AppColors.white
                                        : AppColors.black,
                                  ),
                                )),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: 0.8.r,
                      children: List.generate(
                        controller.products.length,
                        (index) {
                          return Column(
                            children: [
                              InkWell(
                                child: Container(
                                  width: 150.w,
                                  height: 150.h,
                                  decoration: BoxDecoration(
                                    color: AppColors.grey.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                onTap: () {
                                  Get.to(const ProductDesc());
                                },
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(controller.products[index].name,
                                      style:
                                          AppTextStyle.subtitleBoldTextStyle),
                                  Text(
                                    "\$" +
                                        controller.products[index].price
                                            .toString() +
                                        ".00             ✨ ",
                                    style: AppTextStyle.subtitleTextStyle,
                                  ),
                                ],
                              )
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
