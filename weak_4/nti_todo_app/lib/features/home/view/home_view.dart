import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nti_todo_app/core/utils/app_assets.dart';
import 'package:nti_todo_app/core/utils/app_colors.dart';
import 'package:nti_todo_app/features/home/data/category_model.dart';
import 'package:nti_todo_app/features/home/view/widgets/custom_row.dart';
import 'package:nti_todo_app/features/home/view/widgets/category_task_container.dart';
import 'package:nti_todo_app/features/home/view/widgets/list_category_task.dart';
import '../../../core/utils/app_paddings.dart';
import 'widgets/default_app_bar.dart';
import 'widgets/progress_container.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
