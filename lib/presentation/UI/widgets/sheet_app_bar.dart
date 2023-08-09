import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:instar/core/style/colors.dart';

import '../../state_managment/controllers/main_page_controller.dart';

class SheetAppBar extends StatelessWidget {
  final String text;
  const SheetAppBar({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
        init: MainController(),
        initState: (_) {},
        builder: (controller) {
          return Padding(
            padding: EdgeInsets.only(top:18.0.r),
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
                          // Get.to(Profile());
                        },
                        icon: Icon(
                          Icons.menu,
                          color: AppColors.black,
                          size: 30.sp,
                        )),
                    Text(text),
                    Icon(
                      Icons.notifications_none_outlined,
                      color: AppColors.black,
                      size: 30.sp,
                    ),
                  ],
                ),
                AnimSearchBar(
                  width: 400.w,
                  textController: controller.textController,
                  rtl: true,
                  onSuffixTap: () {
                    // textController.clear();
                  },
                  onSubmitted: (String) {},
                ),
              ],
            ),
          );
        
        }
        );
  
  }
}
