import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nti_todo_app/core/utils/app_colors.dart';
import 'package:nti_todo_app/features/login/view/login_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'features/home/view/home_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  var sharedPref = await SharedPreferences.getInstance();
  var accessToken = sharedPref.getString('access_token');
  runApp(MyApp(screen: accessToken != null ? HomeView(): LoginView(),));

  FirebaseAuth.instance
      .authStateChanges()
      .listen((User? user) {
    if (user == null) {
      print('User is currently signed out!');
    } else {
      print('User is signed in!');
    }
  });
}
class MyApp extends StatelessWidget {
  final Widget screen;
  const MyApp({super.key, required this.screen});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context,widget)=> MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.background
        ),
        debugShowCheckedModeBanner: false,
        home:screen //FirebaseAuth.instance.currentUser == null ? const SplashView() : const HomeView()
      ),
    );
  }
}
