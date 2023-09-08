import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instar/core/style/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instar/core/style/text_style.dart';

class CategoryComponeny extends StatelessWidget {
  final String image_path;
  final String category_name;
  const CategoryComponeny(
      {super.key, required this.image_path, required this.category_name});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1.0,
      borderOnForeground: true,
      borderRadius: BorderRadius.circular(15.r),
      child: SizedBox(
        width: 155.w,
        height: 180.h,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SvgPicture.asset(image_path, semanticsLabel: 'Acme Logo'),
              Text(category_name, style: AppTextStyle.elementNameTextStyle)
            ],
          ),
        ),
      ),
    );
  }
}
