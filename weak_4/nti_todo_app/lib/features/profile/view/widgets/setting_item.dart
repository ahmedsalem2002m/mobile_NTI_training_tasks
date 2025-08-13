import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nti_todo_app/core/utils/app_assets.dart';
import 'package:nti_todo_app/features/profile/data/setting_model.dart';

import '../../../../core/utils/app_colors.dart';

class SettingItem extends StatelessWidget {
  const SettingItem({required this.settingModel, super.key});
  final SettingModel settingModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: settingModel.onTap,
          child: Container(
            width: double.infinity,
            height: 63.h,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(15.r),
            ),
            padding: REdgeInsets.symmetric(
              horizontal: 20.sp,
              vertical: 20.sp,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(settingModel.preIconPath),
                    SizedBox(width: 16.w),
                    Text(
                      settingModel.title,
                      style: TextStyle(
                        color: AppColors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                SvgPicture.asset(AppAssets.arrow),
              ],
            ),
          ),
        ),
        SizedBox(height: 25.h),
      ],
    );
  }
}


