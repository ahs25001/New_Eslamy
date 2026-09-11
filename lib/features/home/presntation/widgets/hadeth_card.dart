import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_islamy/routes/app_routes.dart';

import '../../../../style/app_colors.dart';
import '../../../../style/app_text_styles.dart';
import '../../../../utils/app_pathes.dart';
import '../data/models/hadeth_model.dart';

class HadethCard extends StatelessWidget {
  final List<String> hadeth;
  final int index ;
  const HadethCard({super.key, required this.hadeth,required this.index});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          AppRoutes.hadethDetails,
          arguments: HadethModel(
            hadethIndex: index,
            hadethTitle: hadeth[0],
            hadethBody: hadeth[1],
          ),
        );
      },
      child: Hero(
         tag: 'h${index+1}',
        child: Card(
          color: AppColors.gold,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
                    child: Row(
                      children: [
                        Image.asset(
                          AppPathies.hadethLeftCornerImage,
                          width: 93.w,
                          height: 100.h,
                        ),
                        Spacer(),
                        Image.asset(
                          AppPathies.hadethRightCornerImage,
                          width: 93.w,
                          height: 100.h,
                        ),
                      ],
                    ),
                  ),
                  Image.asset(
                    AppPathies.hadethCardBackground,
                    width: double.infinity,
                    height: 335.h,
                  ),
                  Image.asset(
                    AppPathies.hadethBottomBackground,
                    height: 90.h,
                    width: double.infinity,
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  children: [
                    SizedBox(height: 45.h),
                    Text(hadeth[0], style: AppTextStyles.hadethCardTitleStyle),
                    SizedBox(height: 10.h),
                    Text(
                      hadeth[1],
                      textDirection: TextDirection.rtl,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      maxLines: 18,
                      style: AppTextStyles.hadethCardTextStyle,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
