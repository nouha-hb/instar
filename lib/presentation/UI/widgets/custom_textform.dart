import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instar/core/style/colors.dart';

class ReusableTextField extends StatelessWidget {
  final String text;
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;
  final TextInputType keyboardType;
  final int width;
  final int height;

  const ReusableTextField(
      {super.key,
      required this.text,
      required this.controller,
      required this.keyboardType,
      required this.validator,
      required this.height,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: this.width.w,
      height: this.height.h,
      child: TextFormField(
        controller: controller,
        validator: validator,
        keyboardType: keyboardType,
        cursorColor: Colors.black,
        style: TextStyle(color: Colors.black.withOpacity(0.9)),
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.black, width: 1.0),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.black, width: 1.0),
            borderRadius: BorderRadius.circular(8),
          ),
          hintText: text,
          hintStyle: const TextStyle(
              color: AppColors.grey, fontWeight: FontWeight.w400),
          labelStyle: TextStyle(color: AppColors.black.withOpacity(0.9)),
          filled: true,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          fillColor: AppColors.white.withOpacity(0.3),
        ),
      ),
    );
  }
}
