import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/style/colors.dart';
import '../../../core/style/text_style.dart';

class SettingComponent extends StatelessWidget {
  final String text;
  final IconData iconData;
  final double width;
  final double height;

  const SettingComponent({
    super.key,
    required this.text,
    required this.iconData,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width.w,
      height: height.h,
      decoration: BoxDecoration(
          color: AppColors.white, borderRadius: BorderRadius.circular(15.r)),
      child: ListTile(
        leading: Container(
            width: 25.w,
            height: 25.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.r),
                border: Border.all(color: AppColors.primary)),
            child: Icon(iconData, color: AppColors.primary)),
        title: Text(text, style: AppTextStyle.elementNameTextStyle),
      ),
    );
  }
}
