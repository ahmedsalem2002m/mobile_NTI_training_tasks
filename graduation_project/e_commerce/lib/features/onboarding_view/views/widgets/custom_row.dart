import 'package:e_commerce/core/helper/app_navigator.dart';
import 'package:e_commerce/features/get_start_view/views/get_start_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/utils/app_colors.dart';
import 'custom_indicator.dart';

class CustomRow extends StatefulWidget {
  final int index;
  final BuildContext context;
  final PageController controller;

  const CustomRow({
    required this.index,
    required this.controller,
    super.key, required this.context,
  });

  @override
  State<CustomRow> createState() => _CustomRowState();
}

class _CustomRowState extends State<CustomRow> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          widget.index == 0
              ? SizedBox()
              : GestureDetector(
            onTap: () {
              widget.controller.previousPage(
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
                child: CustomIndicator(active: widget.index == i),
              );
            }),
          ),
          GestureDetector(
            onTap: () {
              if (widget.index < 2) {
                widget.controller.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              } else {
                AppNavigator.goTo(
                  context,
                  const GetStartView(),
                  type: NavigatorType.pushReplacement,
                );
              }
            },
            child: Text(
              widget.index == 2 ? "Get Started" : "Next",
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
