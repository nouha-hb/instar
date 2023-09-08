import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instar/core/style/colors.dart';
import 'package:instar/core/style/text_style.dart';

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
             enabledBorder: UnderlineInputBorder(      
                      borderSide: BorderSide(color:AppColors.grey),   
                      ),  
              focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.primary),
                   ),  
         
          hintText: text,
          hintStyle: AppTextStyle.lightLabelTextStyle,
         // labelStyle: TextStyle(color: AppColors.black.withOpacity(0.9)),
          filled: true,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          fillColor: AppColors.white.withOpacity(0.3),
        ),
      ),
    );
  }
}

class NumberInput extends StatelessWidget {
  NumberInput({
    this.controller,
    this.value,
    this.onChanged,
    this.error,
    this.allowDecimal = false,
    this.isEmpty = true,
  });

  final TextEditingController? controller;
  final String? value;
  final Function? onChanged;
  final String? error;
  final bool isEmpty;

  final bool allowDecimal;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 50.w,
          height: 60.h,
          child: TextFormField(
            cursorColor: AppColors.darkGrey,
            textAlign: TextAlign.center,
            controller: controller,
            initialValue: value,
            keyboardType:
                TextInputType.numberWithOptions(decimal: allowDecimal),
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide:
                    BorderSide(color: AppColors.grey, width: 3.w),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: AppColors.primary, width: 3.w),
              ),
              errorText: error,
            ),
          ),
        ),
      ],
    );
  }

  String _getRegexString() =>
      allowDecimal ? r'[0-9]+[,.]{0,1}[0-9]*' : r'[0-9]';
}
