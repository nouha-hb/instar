import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instar/core/style/colors.dart';
import 'package:instar/core/style/text_style.dart';

class ProfileButton extends StatelessWidget {
  final IconData icon;
  final String text;
  const ProfileButton({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 325.w,
        height: 60.h,
        decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(13.r)),
        child: Padding(
          padding:  EdgeInsets.all(8.0.r),
          child: Row(
            children: [
              Container(
                width: 40.h,
                height: 40.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(color: AppColors.primary)),
                child: Center(child: Icon(icon, size: 15.sp,color: AppColors.primary,)),
              ), 
              SizedBox(
                width: 20.w,
              ),
              Text(text, style: AppTextStyle.elementNameTextStyle,),
              
            ],
          ),
        ),
      ),
    );
  }
}
