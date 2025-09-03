import 'dart:async';

import 'package:e_commerce/core/utils/app_assets.dart';
import 'package:e_commerce/features/get_start_view/views/get_start_view.dart';
import 'package:e_commerce/features/onboarding_view/views/onboarding_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/helper/app_navigator.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 2),(){
      AppNavigator.goTo(context,GetStartView());
    });

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
