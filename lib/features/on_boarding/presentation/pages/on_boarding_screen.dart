import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_islamy/features/on_boarding/presentation/cubit/on_boarding_cubit.dart';
import 'package:new_islamy/routes/app_routes.dart';
import 'package:new_islamy/style/app_colors.dart';
import 'package:new_islamy/style/app_text_styles.dart';
import 'package:new_islamy/utils/app_constants.dart';
import 'package:new_islamy/utils/app_pathes.dart';
import 'package:new_islamy/utils/app_strings.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnBoardingCubit(),
      child: Scaffold(
        backgroundColor: AppColors.black,
        body: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  SizedBox(height: 26.h),
                  Image.asset(
                    AppPathies.backGroundMosque,
                    height: 171.h,
                    width: 291.w,
                  ),
                ],
              ),
            ),
            Column(
              children: [
                SizedBox(height: 101.h),
              Text(AppStrings.appName,style: AppTextStyles.appNameTextStyle,),
                BlocSelector<OnBoardingCubit, OnBoardingState, int>(
                  selector: (state) {
                    return state.currentPage ?? 0;
                  },
                  builder: (context, currentPage) {
                    return Expanded(
                      child: PageView(
                        physics: NeverScrollableScrollPhysics(),
                        controller: context
                            .read<OnBoardingCubit>()
                            .pageController,
                        children: onBoardingPages,
                      ),
                    );
                  },
                ),

                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 16.h,
                  ),
                  child: Row(
                    children: [
                      BlocBuilder<OnBoardingCubit, OnBoardingState>(
                        builder: (context, state) {
                          return ((state.currentPage ?? 0) >= 1)
                              ? InkWell(
                                  onTap: () {
                                    context.read<OnBoardingCubit>().changePage(
                                      state.currentPage! - 1,
                                    );
                                  },
                                  child: Text(
                                    "Back",
                                    style: TextStyle(
                                      color: AppColors.gold,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                )
                              : SizedBox();
                        },
                      ),
                      Spacer(),
                      BlocBuilder<OnBoardingCubit, OnBoardingState>(
                        builder: (context, state) {
                          return SmoothPageIndicator(
                            controller: context
                                .read<OnBoardingCubit>()
                                .pageController,
                            count: 5,

                            effect: ExpandingDotsEffect(
                              dotHeight: 14.h,
                              dotWidth: 14.w,
                              activeDotColor: AppColors.gold,
                              dotColor: AppColors.gray,
                            ),
                          );
                        },
                      ),

                      Spacer(),
                      BlocBuilder<OnBoardingCubit, OnBoardingState>(
                        builder: (context, state) {
                          return (state.currentPage! < 4)
                              ? InkWell(
                                  onTap: () {
                                    context.read<OnBoardingCubit>().changePage(
                                      state.currentPage! + 1,
                                    );
                                  },
                                  child: Text(
                                    "Next",
                                    style: TextStyle(
                                      color: AppColors.gold,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                )
                              : InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                      context,
                                      AppRoutes.home,
                                    );
                                  },
                                  child: Text(
                                    "Done",
                                    style: TextStyle(
                                      color: AppColors.gold,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
