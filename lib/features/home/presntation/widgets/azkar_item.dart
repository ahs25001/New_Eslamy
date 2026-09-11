import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../style/app_colors.dart';
import '../../../../style/app_text_styles.dart';
class AzkarItem extends StatelessWidget {
   String imagePath;
   String title;
  VoidCallback onTab ;

   AzkarItem({super.key, required this.imagePath, required this.title, required this.onTab});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=> onTab(),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20.h),
        width: 185.w,
        height: 280.h,
        decoration: BoxDecoration(
          color: AppColors.transparent,
          borderRadius: BorderRadiusGeometry.circular(20.r),
          border: Border.all(color: AppColors.gold,width: 2.w),
        ),
        child: Column(
          children: [
            Image.asset(imagePath),
            SizedBox(height: 10.h),
            Text(title, style: AppTextStyles.suraNameStyle),
          ],
        ),
      ),
    );
  }
}
