import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomOnboardingView extends StatelessWidget {
  const CustomOnboardingView({
    super.key,
    required this.title,
    required this.iconPath,
  });

  final String title;
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(iconPath),
          SizedBox(height: 15.h),
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 24.sp,
              color: AppColors.black,
            ),
          ),
          SizedBox(height: 10.h),
          Text(
            textAlign: TextAlign.center,
            "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.",
            style: TextStyle(
              fontSize: 14.sp,
              color: AppColors.textColorThird,
            ),
          ),
        ],
      ),
    );
  }
}
