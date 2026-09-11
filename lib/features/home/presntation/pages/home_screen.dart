import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_islamy/features/home/presntation/cubit/home_cubit.dart';
import 'package:new_islamy/style/app_colors.dart';
import 'package:new_islamy/utils/app_constants.dart';
import '../../../../utils/app_pathes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,

        bottomNavigationBar: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return CurvedNavigationBar(
              index: state.currentTab ?? 0,
              color: AppColors.gold,
              backgroundColor: AppColors.black,
              onTap: (value) {
                context.read<HomeCubit>().changeCurrentTab(value);
              },
              items: [
                CurvedNavigationBarItem(
                  child: SvgPicture.asset(AppPathies.quranIcon),
                  label: 'Quran',
                ),
                CurvedNavigationBarItem(
                  child: SvgPicture.asset(AppPathies.hadethIcon),
                  label: 'Hadeth',
                ),
                CurvedNavigationBarItem(
                  child: SvgPicture.asset(AppPathies.sebhaIcon),
                  label: 'Sebha',
                ),
                CurvedNavigationBarItem(
                  child: SvgPicture.asset(AppPathies.radioIcon),
                  label: 'Radio',
                ),
                CurvedNavigationBarItem(
                  child: SvgPicture.asset(AppPathies.timeIcon),
                  label: 'Time',
                ),
              ],
            );
          },
        ),
        body: BlocSelector<HomeCubit, HomeState, int>(
          selector: (state) {
            return state.currentTab ?? 0;
          },
          builder: (context, state) {
            return PageView(
              physics: NeverScrollableScrollPhysics(),
              controller: context.read<HomeCubit>().pageController,
              children: homeTabs,
            );
          },
        ),
      ),
    );
  }
}
