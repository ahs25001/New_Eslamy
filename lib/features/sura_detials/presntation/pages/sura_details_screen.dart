import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_islamy/features/sura_detials/presntation/cubit/sura_details_cubit.dart';
import 'package:new_islamy/style/app_colors.dart';
import 'package:new_islamy/style/app_text_styles.dart';
import 'package:new_islamy/utils/app_pathes.dart';

import '../../../../utils/app_constants.dart';

class SuraDetailsScreen extends StatelessWidget {
  final int suraIndex;

  const SuraDetailsScreen({super.key, required this.suraIndex});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SuraDetailsCubit()..loadSura(suraIndex),
      child: BlocBuilder<SuraDetailsCubit, SuraDetailsState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(title: Text(englishQuranSurahs[suraIndex])),
            body: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Hero(
                  tag: '${suraIndex + 1}',
                  child: Material(
                    color: Colors.transparent,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              AppPathies.quranLeftCornerImage,
                              width: 92.w,
                              height: 92.h,
                            ),
                            Text(
                              arabicQuranSuras[suraIndex],
                              style: AppTextStyles.suraTitleStyle,
                            ),
                            Image.asset(
                              AppPathies.quranRightCornerImage,
                              width: 92.w,
                              height: 92.h,
                            ),
                          ],
                        ),
                        SizedBox(height: 20.h),
                        Expanded(
                          child: PageView.builder(
                            itemBuilder: (context, index) =>(index==0&&suraIndex!=8)?SingleChildScrollView(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 20.w,
                                ),
                                child:
                                Column(
                                  children: [
                                    Text("بِسْمِ اللَّهِ الرَّحْمَنِ الرَّحِيمِ",style: AppTextStyles.basmalaStyle,),
                                    Text(
                                      textAlign: TextAlign.justify,
                                      textDirection: TextDirection.rtl,
                                      state.suraPages?[index] ?? "",

                                      style: AppTextStyles.ayatStyle,
                                    ).fadeIn(
                                      duration: Duration(milliseconds: 500),
                                    ),
                                  ],
                                ),
                              ),
                            ):
                                SingleChildScrollView(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 20.w,
                                    ),
                                    child:
                                        Text(
                                          textAlign: TextAlign.justify,
                                          textDirection: TextDirection.rtl,
                                          state.suraPages?[index] ?? "",

                                          style: AppTextStyles.ayatStyle,
                                        ).fadeIn(
                                          duration: Duration(milliseconds: 500),
                                        ),
                                  ),
                                ),
                            itemCount: state.suraPages?.length ?? 0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Image.asset(AppPathies.suraDetailsBackground),
              ],
            ),
          );
        },
      ),
    );
  }
}
