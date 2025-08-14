import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nti_todo_app/core/utils/app_assets.dart';
import 'package:nti_todo_app/features/home/view/widgets/custom_row.dart';
import 'package:nti_todo_app/features/home/view/widgets/list_category_task.dart';
import 'package:nti_todo_app/features/home/view/widgets/list_task_group.dart';
import '../../../core/utils/app_paddings.dart';
import '../../../core/widgets/default_app_bar.dart';
import 'widgets/progress_container.dart';

class HomeView extends StatefulWidget {
  HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<String> tasks = [
    // "Ahmed"
  ];

  @override
  Widget build(BuildContext context) {
    return tasks.isEmpty
        ? Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: AppPaddings.defaultHomePadding,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DefaultAppBar(),
                          SizedBox(height: 79.h),
                          Center(
                            child: Text(
                              textAlign: TextAlign.center,
                              "There are no tasks yet,\n Press the button\n To add New Task",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w300
                              ),
                            ),
                          ),
                          SizedBox(height: 39.h,)
                        ],
                      ),
                    ),
                    SvgPicture.asset(AppAssets.homeImage)
                  ],
                ),
              ),
            ),
          )
        : Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: AppPaddings.defaultHomePadding,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DefaultAppBar(),
                          SizedBox(height: 34.h),
                          ProgressContainer(),
                          SizedBox(height: 26.h),
                          CustomRow(text: "In Progress"),
                          SizedBox(height: 23.h),
                        ],
                      ),
                    ),
                    ListCategoryTask(),
                    Padding(
                      padding: AppPaddings.defaultHomePadding,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 26.h),
                          CustomRow(text: "Task Groups", show: false),
                          SizedBox(height: 23.h),
                          ListTaskGroup(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
