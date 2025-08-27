import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/utils/app_assets.dart';
import 'package:news_app/core/utils/app_colors.dart';
import 'package:news_app/core/utils/app_paddings.dart';
import 'package:news_app/core/widgets/default_app_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          DefaultAppBar(),
          Padding(
            padding: AppPaddings.defaultHomePadding,
            child: Column(
              children: [
                SizedBox(height: 20.h),
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Image.asset(AppAssets.image_1),
                    Container(
                      height: 66.h,
                      width: 375.w,
                      child: Padding(
                        padding: AppPaddings.defaultSecondHomePadding,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Experience the Serenity of\nJapan's Traditional Countryside",
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: AppColors.primary,
                              ),
                            ),
                            Text(
                              "Luc Olinga",
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: AppColors.primary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 3.w,
                    children: [
                      CircleAvatar(radius: 3),
                      CircleAvatar(
                        backgroundColor: AppColors.buttonPrimary,
                        radius: 3,
                      ),
                      CircleAvatar(radius: 3),
                    ],
                  ),
                ),
                SizedBox(height: 12.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Most Popular",
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "See More",
                      style: TextStyle(
                        color: AppColors.buttonPrimary,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
