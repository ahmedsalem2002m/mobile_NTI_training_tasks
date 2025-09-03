import 'package:e_commerce/core/helper/app_navigator.dart';
import 'package:e_commerce/features/get_start_view/views/get_start_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import 'custom_indicator.dart';

class CustomRow extends StatelessWidget {
  final int index;
  final PageController controller;

  const CustomRow({
    required this.index,
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          index == 0
              ? SizedBox()
              : GestureDetector(
            onTap: () {
              controller.previousPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
            child: Text(
              "Prev",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18.sp,
                color: AppColors.textColorThird,
              ),
            ),
          ),
          Row(
            children: List.generate(3, (i) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.w),
                child: CustomIndicator(active: index == i),
              );
            }),
          ),
          GestureDetector(
            onTap: () {
              if (index < 2) {
                controller.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              } else {
                AppNavigator.goTo(
                  context,
                  GetStartView(),
                  type: NavigatorType.pushReplacement,
                );
              }
            },
            child: Text(
              index == 2 ? "Get Started" : "Next",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18.sp,
                color: AppColors.colorButton,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
