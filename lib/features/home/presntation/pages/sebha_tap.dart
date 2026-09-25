import 'package:animate_do/animate_do.dart';
import 'package:animated_digit/animated_digit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_islamy/features/home/presntation/cubit/home_cubit.dart';
import 'package:new_islamy/style/app_text_styles.dart';
import '../../../../core/utils/app_constants.dart';
import '../../../../core/utils/app_pathes.dart';
import '../../../../core/utils/app_sheared_widgets.dart';
import '../../../../style/app_colors.dart';
class SebhaTap extends StatelessWidget {
  const SebhaTap({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(
          AppPathies.sebhaBackground,
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [AppColors.black, AppColors.black.withAlpha(700)],
            ),
          ),
        ),
        Column(
          children: [
            AppShearedWidgets.islameyLogo(),
            SizedBox(height: 16.h),
            Text(
              "سَبِّحِ اسْمَ رَبِّكَ الأَعْلَى",
              style: AppTextStyles.sebhaTextStyle,
            ),
            SizedBox(height: 16.h),
            Image.asset(AppPathies.sebhaHed, width: 73.w, height: 86.h),
            BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                return InkWell(
                  onTap: () {
                    context.read<HomeCubit>().onSebhaTap();
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      SvgPicture.asset(
                        AppPathies.sebhaBody,
                        height: 380.h,
                        width: 380.w,
                      ).spinPerfect(
                        spins: 1 / 30,
                        duration: Duration(milliseconds: 500),
                        controller: (controller) {
                          if (state.homeStatus == HomeStatus.sebhaChanged) {
                            controller.repeat(count: 1);
                          }
                        },
                      ),
                      Column(
                        children: [
                          SizedBox(
                            width: 250.w,
                            child: Text(
                              textAlign: TextAlign.center,
                              azkar[(state.tasbehIndex ?? 0) % azkar.length],
                              style: AppTextStyles.sebhaTextStyle,
                            ).fadeIn(

                              duration: Duration(seconds: 2),controller: (controller) {
                              if(state.sebhaCount==0){
                                controller.reset();
                                controller.forward();
                              }
                            },),
                          ),
                          SizedBox(height: 56.h),
                          AnimatedDigitWidget(
                            value:  state.sebhaCount,
                            textStyle: AppTextStyles.sebhaTextStyle,
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}
