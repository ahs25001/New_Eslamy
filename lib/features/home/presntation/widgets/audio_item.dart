import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_pathes.dart';
import '../../../../style/app_colors.dart';

class AudioItem extends StatelessWidget {
  const AudioItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 390.w,
      height: 133.h,
      padding: EdgeInsets.only(top: 15.h),
      margin: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 10.h,
      ),
      decoration: BoxDecoration(
        color: AppColors.gold,
        borderRadius: BorderRadiusDirectional.circular(15.r),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            AppPathies.radioItemBackground,
            width: double.infinity,
            height: 100.h,
            fit: BoxFit.cover,
          ),
          Column(
            children: [
              Text("Radio Ibrahim Al-Akdar"),
              Spacer(),
              Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Spacer(flex: 3),
                    ImageIcon(
                      AssetImage(AppPathies.playIcon),
                      size: 30.sp,
                    ),
                    SizedBox(width: 20.w),
                    ImageIcon(
                      AssetImage(AppPathies.volumeOnIcon),
                      size: 30.sp,
                    ),
                    Spacer(flex: 2),
                  ],
                ),
              ),
              SizedBox(height: 20.h,)
            ],
          ),
        ],
      ),
    );
  }
}
