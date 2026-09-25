import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_islamy/features/home/presntation/cubit/home_cubit.dart';
import 'package:new_islamy/features/home/presntation/widgets/sura_list_tile.dart';

import '../../../../core/utils/app_constants.dart';
import '../../../../core/utils/app_pathes.dart';
import '../../../../core/utils/app_sheared_widgets.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../routes/app_routes.dart';
import '../../../../style/app_colors.dart';
import '../../../../style/app_text_styles.dart';
import '../data/models/sura_model.dart';
import '../widgets/more_recently_list_item.dart';

class QuranTab extends StatelessWidget {
  const QuranTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          AppPathies.quranBackground,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
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
        ListView(
          children: [
            AppShearedWidgets.islameyLogo(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: TextFormField(
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.ofWhite,
                  fontWeight: FontWeight.w700,
                ),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColors.black.withAlpha(90),
                  prefixIcon: ImageIcon(
                    AssetImage(AppPathies.quranGoldIcon),
                    color: AppColors.gold,
                    size: 28.sp,
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 14.w,
                    vertical: 14.h,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide(color: AppColors.gold, width: 1.w),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide(color: AppColors.gold, width: 1.w),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide(color: AppColors.gold, width: 1.w),
                  ),
                  hintText: AppStrings.suraName,
                  hintStyle: TextStyle(fontSize: 14.sp, color: AppColors.gray),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            BlocSelector<HomeCubit, HomeState, List<SuraModel>>(
              selector: (state) {
                return state.mostRecently!;
              },
              builder: (context, state) {
                return Visibility(
                  visible: state.isNotEmpty,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            AppStrings.mostRecently,
                            style: AppTextStyles.subTitleStyle,
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h),
                      SizedBox(
                        height: 150.h,
                        child: BlocBuilder<HomeCubit, HomeState>(
                          builder: (context, state) {
                            return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: state.mostRecently?.length ?? 0,
                              itemBuilder: (context, index) => InkWell(
                                onTap: () {
                                  context
                                      .read<HomeCubit>()
                                      .addSuraToMostRecently(
                                        state.mostRecently![index].index,
                                      );
                                  Navigator.pushNamed(
                                    context,
                                    AppRoutes.suraDetails,
                                    arguments: state.mostRecently![index].index,
                                  );
                                },
                                child: MoreRecentlyListItem(
                                  suraModel: state.mostRecently![index],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Text("Suras List", style: AppTextStyles.subTitleStyle),
            ),
            SizedBox(height: 20.h),
            ListView.separated(
              separatorBuilder: (context, index) => Divider(
                indent: 64.w,
                endIndent: 64.w,
                color: AppColors.white,
              ),
              shrinkWrap: true,
              itemCount: 114,
              itemBuilder: (context, index) =>
                  BlocBuilder<HomeCubit, HomeState>(
                    buildWhen: (previous, current) => false,
                    builder: (context, state) {
                      return InkWell(
                        onTap: () {
                          context.read<HomeCubit>().addSuraToMostRecently(
                            index,
                          );
                          Navigator.pushNamed(
                            context,
                            AppRoutes.suraDetails,
                            arguments: index,
                          );
                        },
                        child: SuraListTile(
                          suraModel: SuraModel(
                            index: index + 1,
                            suraAyatNumber: ayaNumberList[index],
                            suraName: arabicQuranSuras[index],
                            suraNameEnglish: englishQuranSurahs[index],
                          ),
                        ),
                      );
                    },
                  ),
              physics: NeverScrollableScrollPhysics(),
            ),
          ],
        ),
      ],
    );
  }
}
