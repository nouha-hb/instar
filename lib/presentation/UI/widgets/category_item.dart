import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instar/core/style/text_style.dart';

class CategoryItem extends StatelessWidget {
  final String image;
  final String title;
  const CategoryItem({super.key,required this.image,required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:6.0),
      child: Stack(
        alignment: Alignment.center,
        children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: ColorFiltered(
            colorFilter: const ColorFilter.mode(
              Colors.grey,
              BlendMode.modulate,
            ),
            child: Image.network(image,fit: BoxFit.fitHeight, width: 100.w,height: 120.h,))),
        Positioned(
          bottom: 10,
          child: Text(title,style: AppTextStyle.primaryButtonTextStyle,))
      ],),
    );
  }
}