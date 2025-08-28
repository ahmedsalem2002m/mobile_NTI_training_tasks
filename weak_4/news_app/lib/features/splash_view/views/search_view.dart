import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_app/core/utils/app_assets.dart';
import 'package:news_app/core/utils/app_colors.dart';
import 'package:news_app/core/utils/app_paddings.dart';
import 'package:news_app/features/home_view/views/home_view.dart';
import 'package:news_app/features/splash_view/views/widgets/default_form_field.dart';

import '../../../core/helper/app_navigator.dart';
import '../../../navigator_bar.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Column(
        children: [
          SizedBox(height: 80.h),
          Padding(
            padding: AppPaddings.defaultThirdHomePadding,
            child: DefaultFormField(
              prefixIcon: IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(AppAssets.profileIcon),
              ),
              controller: TextEditingController(),
              hintText: "Name",
            ),
          ),
          SizedBox(height: 34.h),
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Image.asset(
                height: 758.h,
                width: double.infinity,
                AppAssets.searchImage,
                fit: BoxFit.cover,
              ),
              Column(
                children: [
                  ElevatedButton(
                    onPressed: (){
                      AppNavigator.goTo(context, NavigatorBar(),type: NavigatorType.pushReplacement);
                    },
                    style:ElevatedButton.styleFrom(
                        backgroundColor: AppColors.buttonPrimary
                    ) ,
                    child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Get Started",
                            style: TextStyle(
                                color: AppColors.primary
                            ),
                          ),
                        ]
                    ),
                  ),
                  SizedBox(height: 34.h,)
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
