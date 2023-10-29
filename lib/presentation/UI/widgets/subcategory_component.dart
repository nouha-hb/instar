import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instar/core/style/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instar/core/style/text_style.dart';

class SubCategoryComponeny extends StatelessWidget {
  final String subcategory_name;
  final double width;
  final double height;
  void onTap;
  SubCategoryComponeny(
      {super.key,
      required this.subcategory_name,
      required this.width,
      required this.height,

      this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        color: AppColors.white,
      ),
      width: width,
      height: height,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // SvgPicture.asset(image_path, semanticsLabel: 'Acme Logo'),
            Text(subcategory_name, style: AppTextStyle.elementNameTextStyle13)
          ],
        ),
      ),
    );
  }
}
