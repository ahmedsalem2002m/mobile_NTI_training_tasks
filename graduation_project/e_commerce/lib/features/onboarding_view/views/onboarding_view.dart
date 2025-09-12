import 'package:e_commerce/core/helper/app_navigator.dart';
import 'package:e_commerce/core/utils/app_assets.dart';
import 'package:e_commerce/features/get_start_view/views/get_start_view.dart';
import 'package:e_commerce/features/onboarding_view/views/widgets/custom_onboarding_view.dart';
import 'package:e_commerce/features/onboarding_view/views/widgets/custom_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/utils/app_colors.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  PageController pageController = PageController();
  int index = 0;

  Future<void> finishOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('is_onboarding_done', true);
    AppNavigator.goTo(
      context,
      const GetStartView(),
      type: NavigatorType.pushReplacement,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.textColorPrimary,
        actions: [
          if (index != 2)
            GestureDetector(
              onTap: finishOnboarding,
              child: Padding(
                padding: EdgeInsets.only(right: 16.w),
                child: Center(
                  child: Text(
                    "Skip",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18.sp,
                      color: AppColors.black,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: pageController,
              onPageChanged: (value) {
                setState(() {
                  index = value;
                });
              },
              children: const [
                CustomOnboardingView(
                  title: "Choose Products",
                  iconPath: AppAssets.onboard_1Icon,
                ),
                CustomOnboardingView(
                  title: "Make Payment",
                  iconPath: AppAssets.onboard_1Icon,
                ),
                CustomOnboardingView(
                  title: "Get Your Order",
                  iconPath: AppAssets.onboard_1Icon,
                ),
              ],
            ),
          ),
          CustomRow(index: index, controller: pageController),
          SizedBox(height: 24.h),
        ],
      ),
    );
  }
}
