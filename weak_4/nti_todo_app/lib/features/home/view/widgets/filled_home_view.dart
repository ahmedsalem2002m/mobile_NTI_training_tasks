import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nti_todo_app/core/helper/my_navigator.dart';
import 'package:nti_todo_app/features/add_task/view/add_task_view.dart';
import 'package:nti_todo_app/features/home/view/widgets/default_floating_action.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_paddings.dart';
import '../../../../core/widgets/default_app_bar.dart';
import 'custom_row.dart';
import 'list_category_task.dart';
import 'list_task_group.dart';
import 'progress_container.dart';

class FilledHomeView extends StatelessWidget {
  final List<String> tasks;
  const FilledHomeView({super.key, required this.tasks});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: DefaultFloatingAction(),
        body: SingleChildScrollView(
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
