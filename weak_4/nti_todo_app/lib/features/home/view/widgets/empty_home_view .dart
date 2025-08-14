import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_paddings.dart';
import '../../../../core/widgets/default_app_bar.dart';

class EmptyHomeView extends StatelessWidget {
  const EmptyHomeView({super.key});

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
                  children: [
                    DefaultAppBar(),
                    SizedBox(height: 79.h),
                    Center(
                      child: Text(
                        "There are no tasks yet,\nPress the button\nTo add New Task",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                      ),
                    ),
                    SizedBox(height: 39.h),
                  ],
                ),
              ),
              SvgPicture.asset(AppAssets.homeImage)
            ],
          ),
        ),
      ),
    );
  }
}
