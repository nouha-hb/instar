import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instar/core/style/colors.dart';

class MyButton extends StatelessWidget {
  final String text;
  final void Function() onClick;
  const MyButton({super.key, required this.text, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onClick,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(AppColors.black),
        minimumSize: MaterialStateProperty.all(Size(70.w, 40.h)),
        foregroundColor: MaterialStateProperty.all(AppColors.white),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      child: Text(text),
    );
  }
}
