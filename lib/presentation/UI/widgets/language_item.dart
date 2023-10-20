import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instar/core/style/colors.dart';

import '../../../core/style/text_style.dart';

// ignore: must_be_immutable
class LanguageItem extends StatelessWidget {
  final String language;
  final int value;
  void Function(int?) onChanged;
  int gvalue;
  LanguageItem({
    super.key,
    required this.language,
    required this.value,
     required this.gvalue,
    required this.onChanged
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 10.0.h),
      child: Container(
        height: 80.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              language,
              style: AppTextStyle.elementNameTextStyle,
            ),
           
               Radio(
                      activeColor: AppColors.primary,
                      value: value,
                      groupValue: gvalue,
                      onChanged:onChanged
                    )
          ]),
        ),
      ),
    );
  }
}
