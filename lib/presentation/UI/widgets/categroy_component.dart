import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instar/core/style/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instar/core/style/text_style.dart';

class CategoryComponeny extends StatelessWidget {
  final String image_path;
  final String category_name;
  final double width;
  final double height;
  const CategoryComponeny(
      {super.key, required this.image_path, required this.category_name, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        color: AppColors.white,
      ),
      width:width,
      height: height,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SvgPicture.asset(image_path, semanticsLabel: 'Acme Logo'),
            Text(category_name, style: AppTextStyle.elementNameTextStyle13)
          ],
        ),
      ),
    );
  }
}
