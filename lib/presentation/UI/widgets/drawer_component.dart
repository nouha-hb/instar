import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instar/core/style/colors.dart';

class DrawerContainer extends StatelessWidget {
  final double? height;
  final Widget? child;
  final double? width;

  const DrawerContainer({
    Key? key,
    this.height,
    required this.child,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      height: height,
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20.r),
            bottomRight: Radius.circular(13.r),
            topLeft: Radius.circular(13.r),
          ),
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              color: AppColors.grey.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            )
          ]),
      child: child,
    );
  }
}
