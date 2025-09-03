
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/features/article_view/views/article_view.dart';
import 'package:news_app/features/splash_view/views/splash_view.dart';
import 'package:news_app/navigator_bar.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      builder: (context,widget)=>MaterialApp(
        debugShowCheckedModeBanner: false,
        home:SplashView(),
      ),
    );
  }
}
