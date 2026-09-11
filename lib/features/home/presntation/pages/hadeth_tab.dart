import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_islamy/features/home/presntation/cubit/home_cubit.dart';
import 'package:new_islamy/features/home/presntation/cubit/home_cubit.dart';

import '../../../../style/app_colors.dart';
import '../../../../style/app_text_styles.dart';
import '../../../../utils/app_pathes.dart';
import '../../../../utils/app_sheared_widgets.dart';
import '../../../../utils/app_strings.dart';
import '../widgets/hadeth_card.dart';

class HadethTab extends StatelessWidget {
  const HadethTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          AppPathies.hadethBackground,
          fit: BoxFit.cover,
          width: double.infinity,
          height: 567.h,
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

            BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                return CarouselSlider.builder(
                  itemCount: state.hadeths!.length,
                  itemBuilder: (context, index, realIndex) =>
                      HadethCard(hadeth: state.hadeths![index].split("?"),index: index,),
                  options: CarouselOptions(
                    initialPage: 0,
                    autoPlay: true,
                    enlargeFactor: 0.2,
                    enlargeCenterPage: true,
                    aspectRatio: 314.w / 438.h,
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
