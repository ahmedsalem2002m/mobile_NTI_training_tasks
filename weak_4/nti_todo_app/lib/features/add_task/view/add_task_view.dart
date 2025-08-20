import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nti_todo_app/core/utils/app_assets.dart';
import 'package:nti_todo_app/core/utils/app_paddings.dart';
import 'package:nti_todo_app/core/widgets/default_btn.dart';
import 'package:nti_todo_app/core/widgets/default_form_field.dart';
import 'package:nti_todo_app/features/add_task/view/widget/dafault_dropdown_btn.dart';

import '../../../core/helper/my_navigator.dart';
import '../../../core/widgets/default_app_bar_two.dart';

class AddTaskView extends StatefulWidget {
   AddTaskView({super.key});

  @override
  State<AddTaskView> createState() => _AddTaskViewState();
}

class _AddTaskViewState extends State<AddTaskView> {
  TextEditingController deadlineController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              DefaultAppBarTwo(
                text: "Add Task",
                leadingIconPath: AppAssets.arrowBack,
              ),
              Padding(
                padding: EdgeInsets.only(
                  right: 57.0.w,
                  left: 57.0.w,
                  top: 46.h,
                  bottom: 29.h,
                ),
                child: Image.asset("assets/images/flag.png"),
              ),
              Padding(
                padding: AppPaddings.defaultThirdHomePadding,
                child: Column(
                  spacing: 15.h,
                  children: [
                    DefaultFormField(
                      controller: TextEditingController(),
                      hintText: "Title",
                    ),
                    DefaultFormField(
                      controller: TextEditingController(),
                      hintText: "Description",
                    ),
                    DefaultDropdownBtn(),
                    DefaultFormField(
                      onTap: () async {
                        final result = await pickDeadlineDateTime(context);
                        if (result != null) {
                          deadlineController.text = result;
                        }
                      },
                      readOnly: true,
                      controller: deadlineController,
                      hintText: "End Time",
                      prefixIcon: IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(AppAssets.calenderIcon),
                      ),
                    ),
                    DefaultBtn(text: "Add Task", onPressed: () {}),
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
