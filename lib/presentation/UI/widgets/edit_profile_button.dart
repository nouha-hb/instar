import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditProfileButton extends StatelessWidget {
  final String text;
  final IconData iconData;
  final Function() onTap;
  const EditProfileButton({super.key, required this.text, required this.iconData, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 325.w,
      height: 60.h,
     
      child: Padding(padding: EdgeInsets.all(8.r),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        Text(text),
        IconButton(icon: Icon(iconData), onPressed: onTap
        ,)
      ],),),
    );
  }
}