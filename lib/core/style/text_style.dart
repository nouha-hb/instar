import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instar/core/style/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyle {
  static TextStyle titleTextStyle = GoogleFonts.alata(
      fontWeight: FontWeight.w400, fontSize: 36.sp, color: AppColors.darkGrey);
  static TextStyle primaryButtonTextStyle = GoogleFonts.alata(
      fontWeight: FontWeight.w400, fontSize: 16.sp, color: AppColors.white);
  static TextStyle secondaryButtonTextStyle = GoogleFonts.alata(
      fontWeight: FontWeight.w400, fontSize: 16.sp, color: AppColors.primary);
  static TextStyle lightLabelTextStyle = GoogleFonts.alata(
      fontWeight: FontWeight.w400, fontSize: 16.sp, color: AppColors.darkGrey);
  static TextStyle smallLightLabelTextStyle = GoogleFonts.alata(
      fontWeight: FontWeight.w400, fontSize: 9.sp, color: AppColors.grey);
  static TextStyle darkLabelTextStyle = GoogleFonts.alata(
      fontWeight: FontWeight.w400, fontSize: 16.sp, color: AppColors.darkGrey);
  static TextStyle blueLabelTextStyle = GoogleFonts.alata(
      fontWeight: FontWeight.w400, fontSize: 16.sp, color: AppColors.primary);
  static TextStyle elementNameTextStyle = GoogleFonts.alata(
      fontWeight: FontWeight.w400, fontSize: 16.sp, color: AppColors.black);
  static TextStyle productTextStyle = GoogleFonts.alata(
      fontWeight: FontWeight.w400, fontSize: 11.sp, color: AppColors.black);
  static TextStyle producDescTitiletTextStyle = GoogleFonts.alata(
      fontWeight: FontWeight.w400, fontSize: 20.sp, color: AppColors.black);

  static TextStyle subTitleTextStyle = GoogleFonts.alata(
    fontWeight: FontWeight.bold,
    fontSize: 15.sp,
    color: AppColors.black,
  );
  static TextStyle greySubTitleTextStyle = GoogleFonts.alata(
    fontWeight: FontWeight.w400,
    fontSize: 13.sp,
    color: AppColors.darkGrey,
  );
  static TextStyle greySubTitleLabelTextStyle = GoogleFonts.alata(
    fontWeight: FontWeight.w600,
    fontSize: 13.sp,
    color: AppColors.darkGrey2,
  );
  static TextStyle smallprimaryButtonTextStyle = GoogleFonts.alata(
      fontWeight: FontWeight.w400, fontSize: 9.sp, color: AppColors.white);

  static TextStyle elementNameTextStyle16 = GoogleFonts.alata(
      fontWeight: FontWeight.w400, fontSize: 16.sp, color: AppColors.black);
  static TextStyle elementNameTextStyle13 = GoogleFonts.alata(
      fontWeight: FontWeight.w400, fontSize: 13.sp, color: AppColors.black);

  static TextStyle onstockTextStyle = GoogleFonts.alata(
      fontWeight: FontWeight.w700, fontSize: 13.sp, color: AppColors.green);
  static TextStyle outofstockTextStyle = GoogleFonts.alata(
      fontWeight: FontWeight.w700, fontSize: 13.sp, color: AppColors.red);
      static TextStyle ratingTextStyle = GoogleFonts.alata(
      fontWeight: FontWeight.w700, fontSize: 30.sp, color: AppColors.primary);
}
