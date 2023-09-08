import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instar/core/style/colors.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final void Function() onClick;
  const PrimaryButton({super.key, required this.text, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onClick,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(AppColors.primary),
        minimumSize: MaterialStateProperty.all(Size(325.w, 50.h)),
        foregroundColor: MaterialStateProperty.all(AppColors.white),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13.r),
          ),
        ),
      ),
      child: Text(text),
    );
  }
}


class SecondaryButton extends StatelessWidget {
  final String text;
  final void Function() onClick;
  const SecondaryButton({super.key, required this.text, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onClick,
      style: ButtonStyle(
      
        backgroundColor: MaterialStateProperty.all(AppColors.white),
        minimumSize: MaterialStateProperty.all(Size(325.w, 50.h)),
        foregroundColor: MaterialStateProperty.all(AppColors.primary),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            side: BorderSide(color: AppColors.primary , width: 2.w),
            borderRadius: BorderRadius.circular(13.r),
          ),
        ),
      ),
      child: Text(text),
    );
  }
}
