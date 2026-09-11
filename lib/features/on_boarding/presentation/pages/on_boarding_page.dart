import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../style/app_colors.dart';

class OnBoardingPage extends StatelessWidget {
  final String imagePath;
  final String title;
  final String massage;

  const OnBoardingPage({
    super.key,
    required this.imagePath,
    required this.title,
    required this.massage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(imagePath, width: 372.w, height: 339.h),
        (massage.trim().isEmpty)?SizedBox(height: 117.h,):SizedBox(height: 70.h,),
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColors.gold,
            fontSize: 24.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 40.h,),
        Text(
          massage,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColors.gold,
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 40.h),
      ],
    );
  }
}
