import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_pathes.dart';
import '../../../home/presntation/data/models/hadeth_model.dart';

import '../../../../style/app_text_styles.dart';

class HadethDetailsScreen extends StatelessWidget {
  final HadethModel hadethModel;

  const HadethDetailsScreen({super.key, required this.hadethModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hadeth ${hadethModel.hadethIndex + 1}")),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Hero(
            tag: 'h${hadethModel.hadethIndex + 1}',
            child: Material(
              color: Colors.transparent,
              child: ListView(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(AppPathies.quranLeftCornerImage,width: 92.w,height: 92.h),
                      Text(
                        hadethModel.hadethTitle,
                        style: AppTextStyles.suraTitleStyle,
                      ),
                      Image.asset(AppPathies.quranRightCornerImage,width: 92.w,height: 92.h),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 20.w),
                    child: Text(
                      hadethModel.hadethBody,
                      style: AppTextStyles.ayatStyle,
                      textAlign: TextAlign.center,
                      textDirection: TextDirection.rtl,
                    ).fadeIn(duration: Duration(milliseconds: 500)),
                  ),
                ],
              ),
            ),
          ),
          Image.asset(AppPathies.suraDetailsBackground),
        ],
      ),
    );
  }
}
