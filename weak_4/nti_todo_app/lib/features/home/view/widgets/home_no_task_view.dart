import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_paddings.dart';
import '../../../../core/widgets/default_app_bar.dart';

class HomeNoTaskView extends StatelessWidget {
  const HomeNoTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: AppPaddings.defaultHomePadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DefaultAppBar(),
                    SizedBox(height: 34.h),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
