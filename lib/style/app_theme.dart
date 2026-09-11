import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_islamy/style/app_colors.dart';

import 'app_text_styles.dart';

abstract class AppTheme {
 static ThemeData lightTheme = ThemeData(
   appBarTheme: AppBarTheme(
    backgroundColor: AppColors.black,
    iconTheme: IconThemeData(color: AppColors.gold,size: 20.sp),
     centerTitle: true,
      titleTextStyle: AppTextStyles.appBarTitleStyle,
   ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
   selectedIconTheme: IconThemeData(
    color: AppColors.ofWhite
   ),
   backgroundColor: AppColors.gold,
   type: BottomNavigationBarType.fixed,
   selectedLabelStyle: TextStyle(
    color: AppColors.ofWhite,
    fontSize: 14.sp,
    fontWeight: FontWeight.w700
   ),
   showUnselectedLabels: false

  ),
   scaffoldBackgroundColor: AppColors.black,
   fontFamily: "Janna LT"
 );
}