import 'package:flutter/material.dart';
import 'package:nti_todo_app/core/utils/colors.dart';
import 'features/splash/view/view/splash_view.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.background
      ),
      debugShowCheckedModeBanner: false,
      home: SplashView()
    );
  }
}
