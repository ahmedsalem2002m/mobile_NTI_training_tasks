import 'package:e_commerce/core/helper/app_navigator.dart';
import 'package:e_commerce/core/utils/app_assets.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/widgets/default_btn.dart';
import 'package:e_commerce/features/login_view/views/ligin_view.dart';
import 'package:e_commerce/features/register_view/views/register_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GetStartView extends StatelessWidget {
  const GetStartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SizedBox.expand(
            child: Image.asset(AppAssets.getStartImage, fit: BoxFit.cover),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 55.w),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.black.withAlpha(200),
                  Colors.black.withAlpha(5),
                ],
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  textAlign: TextAlign.center,
                  "You want\nAuthentic, here\nYou go!",
                  style: TextStyle(
                    color: AppColors.textColorPrimary,
                    fontSize: 34.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 20.h),
                Text(
                  "find it here, but it now!",
                  style: TextStyle(
                    color: AppColors.textColorSecondary,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 20.h),
                Container(
                  width: double.infinity,
                  height: 55,
                  color: AppColors.colorButton,
                  child: DefaultBtn(titleButton: "Login",onPressed:(){
                    AppNavigator.goTo(context, LoginView());
                  }),
                ),
                SizedBox(height: 15.h),
                Container(
                  width: double.infinity,
                  height: 55,
                  color: AppColors.textColorPrimary,
                  child: DefaultBtn(titleButton: "Register", textColor: false,onPressed: (){
                    AppNavigator.goTo(context, RegisterView());
                  },),
                ),
                SizedBox(height: 15.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
