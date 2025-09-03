import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/features/onboarding_view/views/onboarding_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'features/onboarding_view/views/widgets/custom_onboarding_view.dart';
import 'features/splash_view/views/splash_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: (context,widget){
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SplashView(),
          theme: ThemeData(
            scaffoldBackgroundColor: AppColors.textColorPrimary
          ),
        );
      },
    );
  }
}


