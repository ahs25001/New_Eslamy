import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../style/app_text_styles.dart';
import 'app_pathes.dart';
import 'app_strings.dart';

class AppShearedWidgets {
  static Widget islameyLogo() {
    return Column(
      children: [
        SafeArea(
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Image.asset(
                AppPathies.backGroundMosque,
                height: 171.h,
                width: 291.w,
              ),

              Text(
                AppStrings.appName,
                style: AppTextStyles.appNameTextStyle,
              ),
            ],
          ),
        ),

        SizedBox(height: 20.h),
      ],
    );
  }
}