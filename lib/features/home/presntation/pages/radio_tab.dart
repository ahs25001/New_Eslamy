import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_islamy/style/app_text_styles.dart';
import '../../../../core/utils/app_pathes.dart';
import '../../../../core/utils/app_sheared_widgets.dart';
import '../../../../style/app_colors.dart';
import '../widgets/audio_item.dart';
import '../widgets/souund_wave_widget.dart';

class RadioTab extends StatefulWidget {
  const RadioTab({super.key});

  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> with TickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          AppPathies.radioBackground,
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
        Column(
          children: [
            AppShearedWidgets.islameyLogo(),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.w),
              padding: EdgeInsets.zero,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: Color(0XFF202020).withAlpha(120),
              ),
              child: TabBar(
                indicatorColor: Colors.red,
                labelStyle: AppTextStyles.selectedTabTextStyle,
                unselectedLabelStyle: AppTextStyles.unSelectedTabTextStyle,
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(
                  color: AppColors.gold,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                tabs: [
                  Tab(text: "Radio"),
                  Tab(text: "Reciters"),
                ],
                controller: tabController,
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: [
                  ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) => AudioItem(),
                  ),
                  ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) => AudioItem(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
