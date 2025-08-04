import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nti_todo_app/core/utils/AppAssets.dart';

import '../../../lets_start/view/view/lets_start_page.dart';


class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 3),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LetsStartPage()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Image.asset(
            AppAssets.logo,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
