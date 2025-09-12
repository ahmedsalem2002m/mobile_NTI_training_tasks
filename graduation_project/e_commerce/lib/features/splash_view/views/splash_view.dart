import 'dart:async';
import 'package:e_commerce/features/login_view/views/login_view.dart';
import 'package:e_commerce/features/onboarding_view/views/onboarding_view.dart';
import 'package:e_commerce/navigation_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:e_commerce/core/utils/app_assets.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), checkNavigation);
  }

  Future<void> checkNavigation() async {
    final prefs = await SharedPreferences.getInstance();
    final isOnboardingDone = prefs.getBool('is_onboarding_done') ?? false;
    final token = prefs.getString('access_token');

    if (!isOnboardingDone) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const OnboardingView()),
      );
    } else if (token == null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LoginView()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const NavigationView()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SvgPicture.asset(AppAssets.splashIcon),
      ),
    );
  }
}
