import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_islamy/style/app_text_styles.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/utils/app_pathes.dart';
import '../../../../core/utils/app_sheared_widgets.dart';
import '../../../../style/app_colors.dart';
import '../widgets/azkar_item.dart';

class TimeTab extends StatelessWidget {
  const TimeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          AppPathies.timeBackground,
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [AppColors.black, AppColors.black.withAlpha(70)],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                AppShearedWidgets.islameyLogo(),
                Stack(
                  children: [
                    SvgPicture.asset(
                      AppPathies.prayerTimeContainer,
                      width: double.infinity,
                      height: 301.h,
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 26.w,
                            vertical: 15.h,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "date",
                                style: AppTextStyles.unSelectedTabTextStyle,
                              ),
                              Column(
                                children: [
                                  Shimmer.fromColors(
                                    enabled: true,
                                    period: Duration(seconds: 2),
                                    baseColor: AppColors.black,
                                    highlightColor: AppColors.cafe,
                                    child: Text(
                                      "Prayer time",
                                      style: AppTextStyles
                                          .prayerTimeTitleTextStyle,
                                    ),
                                  ),
                                  Text(
                                    "day",
                                    style: TextStyle(
                                      color: AppColors.black,
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                "hejry",
                                style: AppTextStyles.unSelectedTabTextStyle,
                              ),
                            ],
                          ),
                        ),
                        CarouselSlider.builder(
                          itemCount: 5,
                          itemBuilder: (context, index, realIndex) => Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10.w,
                              vertical: 15.h,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.r),
                              gradient: LinearGradient(
                                colors: [AppColors.black, AppColors.cafeLight],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Asr",
                                  style: AppTextStyles.unSelectedTabTextStyle,
                                ),
                                Text(
                                  "15:55",
                                  style: AppTextStyles.prayerTimeTextStyle,
                                ),
                                Text(
                                  "PM",
                                  style: AppTextStyles.unSelectedTabTextStyle,
                                ),
                              ],
                            ),
                          ),
                          options: CarouselOptions(
                            enableInfiniteScroll: false,
                            height: 140.h,
                            viewportFraction: 0.3,
                            enlargeFactor: 0.1,
                            enlargeCenterPage: true,
                          ),
                        ),
                        SizedBox(height: 20.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 34.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Spacer(),
                              Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "Next Pray",
                                      style: TextStyle(
                                        color: AppColors.black.withOpacity(
                                          0.75,
                                        ),
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    TextSpan(
                                      text: " -15:44",
                                      style: TextStyle(
                                        color: AppColors.black,
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Spacer(),
                              ImageIcon(
                                AssetImage(AppPathies.volumeOffIcon),
                                size: 30.sp,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Azkar",
                    style: AppTextStyles.unSelectedTabTextStyle,
                  ),
                ),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     AzkarItem(imagePath: AppPathies.morningAzkarImage, title: 'Morning Azkar', onTab: () {  },),
                     AzkarItem(imagePath: AppPathies.eveningAzkarImage, title: 'Evening Azkar', onTab: () {  },),
                  ],
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
