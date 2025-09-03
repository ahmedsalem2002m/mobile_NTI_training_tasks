import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';

class CustomIndicator extends StatelessWidget {
  final bool active;

  const CustomIndicator({super.key, required this.active});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      decoration: BoxDecoration(
        color: active ? AppColors.black : AppColors.textColorThird,
        borderRadius: BorderRadius.circular(100),
      ),
      duration: Duration(milliseconds: 250),
      width: active ? 30.w : 10.w,
      height: 10.h,
    );
  }
}