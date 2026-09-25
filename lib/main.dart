import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_islamy/routes/app_routes.dart';
import 'package:new_islamy/style/app_theme.dart';

import 'core/shared_preferences/shared_preferences_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await SharedPreferencesServices.init();
   // SharedPreferencesServices.clear();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(430, 932),
      builder: (context, child) => MaterialApp(
        theme: AppTheme.lightTheme,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: (settings) => Rotes.onGenerateRoute(settings),
      ),
    );
  }
}
