import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';

abstract class AppTextStyles {
  static TextStyle appNameTextStyle =  TextStyle(
    color: AppColors.gold,
    fontSize: 80.sp,
    fontFamily: 'Kamali',
    fontWeight: FontWeight.w400,
  );
  static TextStyle subTitleStyle = TextStyle(
  color: AppColors.white,
  fontSize: 16.sp,
  fontWeight: FontWeight.w700,
  );
  static TextStyle suraNameStyle = TextStyle(
    color: AppColors.white,
    fontSize: 20.sp,
    fontWeight: FontWeight.bold,
  );
  static TextStyle numberOfAyatStyle = TextStyle(
    color: AppColors.white,
    fontSize: 14.sp,
    fontWeight: FontWeight.bold,
  );
  static TextStyle appBarTitleStyle = TextStyle(
    color: AppColors.gold,
    fontSize: 20.sp,
    fontWeight: FontWeight.bold,
  );
  static TextStyle suraTitleStyle = TextStyle(
    color: AppColors.gold,
    fontSize: 24.sp,
    fontWeight: FontWeight.bold,
  );
static TextStyle hadethCardTitleStyle = TextStyle(
  color: AppColors.black,
  fontSize: 24.sp,
  fontWeight: FontWeight.bold,
);
  static TextStyle ayatStyle = TextStyle(
    color: AppColors.gold,
    height: 2.5.h,
    fontSize: 20.sp,
    fontWeight: FontWeight.bold,
  );
  static TextStyle basmalaStyle = TextStyle(
    color: AppColors.gold,
    height: 2.5.h,
    fontSize: 24.sp,
    fontWeight: FontWeight.bold,
  );
  static TextStyle hadethCardTextStyle = TextStyle(
    color: AppColors.black,
    fontSize: 16.sp,
    fontWeight: FontWeight.bold,
  );
  static TextStyle sebhaTextStyle = TextStyle(
    color: AppColors.white,
    fontSize: 36.sp,
    fontWeight: FontWeight.bold,
  );
static TextStyle selectedTabTextStyle = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.black
);
static TextStyle unSelectedTabTextStyle = TextStyle(
  color: AppColors.white,
  fontSize: 16.sp,
  fontWeight: FontWeight.bold,
);
static TextStyle prayerTimeTitleTextStyle = TextStyle(
  fontSize: 20.sp,
  fontWeight: FontWeight.bold,
);
static TextStyle prayerTimeTextStyle = TextStyle(
  fontSize: 32.sp,
  color: AppColors.white,
  fontWeight: FontWeight.bold,
);
}