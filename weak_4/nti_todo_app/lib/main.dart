import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nti_todo_app/core/utils/app_colors.dart';
import 'package:nti_todo_app/features/add_task/view/add_task_view.dart';
import 'package:nti_todo_app/features/home/view/home_view.dart';
import 'features/splash/view/view/splash_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context,widget)=> MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.background
        ),
        debugShowCheckedModeBanner: false,
        home: SplashView()
      ),
    );
  }
}
