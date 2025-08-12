import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/utils/app_paddings.dart';
import 'widgets/default_app_bar.dart';
import 'widgets/progress_container.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children:
          [
            Padding(
              padding: AppPaddings.defaultHomePadding,
              child: Column(
                children:
                [
                  DefaultAppBar(),
                  SizedBox(height: 34.h,),
                  ProgressContainer()

                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}