import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_islamy/features/home/presntation/data/models/sura_model.dart';
import 'package:new_islamy/style/app_colors.dart';

import '../../../../core/utils/app_pathes.dart';
import '../../../../style/app_text_styles.dart';

class SuraListTile extends StatelessWidget {
 final SuraModel suraModel ;
  const SuraListTile({
    super.key,
    required this.suraModel,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: '${suraModel.index}',
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
                  Text(suraModel.index.toString(), style: AppTextStyles.subTitleStyle),
                ],
              ),
              SizedBox(width: 20.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(suraModel.suraNameEnglish, style: AppTextStyles.suraNameStyle),
                  SizedBox(height: 10.h),
                  Text("${suraModel.suraAyatNumber} Verses", style: AppTextStyles.numberOfAyatStyle),
                ],
              ),
              Spacer(),
              Text(suraModel.suraName, style: AppTextStyles.suraNameStyle),
            ],
          ),
        ),
      ),
    );
  }
}
