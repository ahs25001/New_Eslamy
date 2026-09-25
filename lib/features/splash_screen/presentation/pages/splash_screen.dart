import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_islamy/core/utils/app_pathes.dart';
import 'package:new_islamy/core/utils/app_strings.dart';
import 'package:new_islamy/routes/app_routes.dart';
import 'package:new_islamy/style/app_text_styles.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 1500)).then((value) {
      Navigator.pushReplacementNamed(context, AppRoutes.home);
    },);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AppPathies.splashScreenBackground,
            width: double.infinity,
            fit: BoxFit.cover,
            height: double.infinity,
          ),
          Center(
            child: Column(
              children: [
                SizedBox(height: 37.h),
                SafeArea(
                  child: Image.asset(
                    AppPathies.backGroundMosque,
                    width: 290.w,
                    height: 150.h,
                  ).zoomIn(duration: Duration(milliseconds: 500)),
                ),
                SizedBox(height: 130.h),
                SvgPicture.asset(
                  AppPathies.appLogo,
                  width: 170.w,
                  height: 155.h,
                ),
                Text(
                  AppStrings.appName,
                  style: AppTextStyles.appNameTextStyle.copyWith(
                    fontSize: 64.sp,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 214.h,
            left: 0,
            child: Image.asset(
              AppPathies.leftStars,
              width: 80.w,
              height: 180.h,
            ).slideInLeft(duration: Duration(milliseconds: 500)),
          ),
          Positioned(
            bottom: 112.h,
            right: 0,
            child: Image.asset(
              AppPathies.rightStars,
              width: 80.w,
              height: 180.h,
            ).slideInRight(duration: Duration(milliseconds: 500)),
          ), Positioned(
            top: 0,
            right: 0,
            child: Image.asset(
              AppPathies.light,
              width: 90.w,
              height: 313.h,
            ).slideDown(duration: Duration(milliseconds: 500)),
          ),
        ],
      ),
    );
  }
}
