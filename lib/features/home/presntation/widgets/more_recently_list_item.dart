import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_islamy/features/home/presntation/data/models/sura_model.dart';
import 'package:new_islamy/style/app_text_styles.dart';

import '../../../../core/utils/app_pathes.dart';
import '../../../../style/app_colors.dart';
class MoreRecentlyListItem extends StatelessWidget {
  final SuraModel suraModel ;

  const MoreRecentlyListItem({super.key,required  this.suraModel});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 380/160,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 10.h,
        ),
        margin: EdgeInsets.symmetric(horizontal: 10.w),
        decoration: BoxDecoration(
          color: AppColors.gold,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Row(
          mainAxisAlignment: .spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              spacing: 10.h,
              children: [
                Text(suraModel.suraNameEnglish,style: AppTextStyles.hadethCardTitleStyle,),
                Text(suraModel.suraName,style: AppTextStyles.hadethCardTitleStyle,),
                Text("${suraModel.suraAyatNumber}  Verses",style: AppTextStyles.selectedTabTextStyle,),
              ],
            ),
            // Spacer(),
            Image.asset(
              AppPathies.suraImage,
              width: 153.w,
              height: 136.h,
            ),
          ],
        ),
      ).fadeInLeft(),
    );
  }

}
