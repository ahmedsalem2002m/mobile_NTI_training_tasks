import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nti_todo_app/core/utils/app_assets.dart';
import 'package:nti_todo_app/core/utils/app_colors.dart';
import 'package:nti_todo_app/core/utils/app_paddings.dart';
import 'package:nti_todo_app/features/profile/cubit/language_cubit/Language_cubit.dart';
import 'package:nti_todo_app/features/profile/cubit/language_cubit/language_state.dart';

import '../../../core/utils/app_assets.dart';
import '../../../core/widgets/default_app_bar_two.dart';

class LanguageView extends StatelessWidget {
  const LanguageView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LanguageCubit(),
      child: SafeArea(
        child: Scaffold(
          // appBar: AppBar(
          //   leading: IconButton(onPressed: (){
          //     Navigator.pop(context);
          //   }, icon: SvgPicture.asset(AppAssets.arrowBack)),
          //   backgroundColor: AppColors.background,
          //   centerTitle: true,
          //   title: Text(
          //     "Settings",
          //     style: TextStyle(
          //       fontSize: 19,
          //       fontWeight: FontWeight.w300
          //     ),
          //   ),
          // ),
          body: Column(
            children: [
              DefaultAppBarTwo(
                text: "Settings",
                leadingIconPath: AppAssets.arrowBack,
              ),
              Padding(
                padding: AppPaddings.defaultHomePadding,
                child: Builder(
                  builder: (context) {
                    return Column(
                      children: [
                        SizedBox(height: 24.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Language",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            BlocBuilder<LanguageCubit, LanguageState>(
                              builder: (context, state) {
                                return Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        LanguageCubit.get(context).changeLan();
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        width: 51.w,
                                        height: 36.h,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(5.r),
                                            bottomLeft: Radius.circular(5.r),
                                          ),
                                          color:
                                              LanguageCubit.get(
                                                context,
                                              ).changeLanguage
                                              ? AppColors.light
                                              : AppColors.primary,
                                        ),
                                        child: Text(
                                          "AR",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        LanguageCubit.get(context).changeLan();
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        width: 51.w,
                                        height: 36.h,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(5.r),
                                            bottomRight: Radius.circular(5.r),
                                          ),
                                          color:
                                              LanguageCubit.get(
                                                context,
                                              ).changeLanguage
                                              ? AppColors.primary
                                              : AppColors.light,
                                        ),
                                        child: Text(
                                          "EN",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
