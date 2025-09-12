import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/features/splash_view/views/splash_view.dart';
import 'package:e_commerce/navigation_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/home_view/views/home_view.dart';
import 'features/login_view/views/login_view.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  var sharedPref = await SharedPreferences.getInstance();
  var accessToken = sharedPref.getString('access_token');
  runApp(MyApp(screen: accessToken != null ? HomeView(): LoginView(),));
}

class MyApp extends StatelessWidget {
  final Widget screen;
  const MyApp({super.key,required this.screen});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: (context,widget){
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: HomeView(),
          theme: ThemeData(
            scaffoldBackgroundColor: AppColors.textColorPrimary
          ),
        );
      },
    );
  }
}


