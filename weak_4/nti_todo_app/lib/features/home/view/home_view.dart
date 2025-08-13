import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nti_todo_app/features/home/view/widgets/custom_row.dart';
import 'package:nti_todo_app/features/home/view/widgets/list_category_task.dart';
import 'package:nti_todo_app/features/home/view/widgets/list_task_group.dart';
import '../../../core/helper/my_navigator.dart';
import '../../../core/utils/app_paddings.dart';
import '../../../core/widgets/default_app_bar.dart';
import '../../profile/view/profile_view.dart';
import 'widgets/progress_container.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    CustomRow(text: "Task Groups",show: false,),
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
