import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nti_todo_app/core/helper/app_pick-time.dart';
import 'package:nti_todo_app/core/utils/app_assets.dart';
import 'package:nti_todo_app/core/utils/app_paddings.dart';
import 'package:nti_todo_app/features/profile/data/setting_model.dart';
import 'package:nti_todo_app/features/profile/view/widgets/list_setting.dart';
import 'package:nti_todo_app/features/profile/view/widgets/setting_item.dart';

import '../../../core/widgets/default_app_bar.dart';

class ProfileView extends StatelessWidget {
  ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: AppPaddings.defaultHomePadding,
          child: Column(
            children: [
              DefaultAppBar(),
              SizedBox(height: 37.h),
              ListSetting(),
            ],
          ),
        ),
      ),
    );
  }
}
