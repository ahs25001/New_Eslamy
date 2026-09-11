import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_islamy/style/app_colors.dart';

import '../../../../style/app_text_styles.dart';
import '../../../../utils/app_pathes.dart';

class SuraListTile extends StatelessWidget {
  final int index;
  final String suraName;
  final String suraAyatNumber;
  final String suraNameEnglish;
  const SuraListTile({
    super.key,
    required this.index,
    required this.suraName,
    required this.suraAyatNumber,
    required this.suraNameEnglish,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(

      tag: '$index',
      child: Material(
        color: Colors.transparent,

        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          child: Row(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  ImageIcon(
                    AssetImage(AppPathies.ayaFrameIcon),
                    color: AppColors.white,
                    size: 52.sp,
                  ),
                  Text(index.toString(), style: AppTextStyles.subTitleStyle),
                ],
              ),
              SizedBox(width: 20.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(suraNameEnglish, style: AppTextStyles.suraNameStyle),
                  SizedBox(height: 10.h),
                  Text("$suraAyatNumber Verses", style: AppTextStyles.numberOfAyatStyle),
                ],
              ),
              Spacer(),
              Text(suraName, style: AppTextStyles.suraNameStyle),
            ],
          ),
        ),
      ),
    );
  }
}
