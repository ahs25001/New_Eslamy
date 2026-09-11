import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../style/app_colors.dart';
import '../../../../utils/app_pathes.dart';

class MoreRecentlyListItem extends StatelessWidget {
  final int index ;

  const MoreRecentlyListItem({super.key,required  this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 283.w,
      padding: EdgeInsets.symmetric(
        horizontal: 10.w,
        vertical: 10.h,
      ),
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      decoration: BoxDecoration(
        color: AppColors.gold,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Sura name"),
              SizedBox(height: 10.h),
              Text("اسم السورة"),
              SizedBox(height: 10.h),
              Text("123456"),
            ],
          ),
          Spacer(),
          Image.asset(
            AppPathies.suraImage,
            width: 153.w,
            height: 136.h,
          ),
        ],
      ),
    ).fadeInLeft();
  }

}
