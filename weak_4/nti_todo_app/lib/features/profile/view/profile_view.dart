import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nti_todo_app/core/utils/app_paddings.dart';
import 'package:nti_todo_app/features/profile/view/widgets/list_setting.dart';
import '../../../core/widgets/default_app_bar.dart';
import '../../login/data/model/login_response_model.dart'; // تأكد من الاستيراد الصحيح

class ProfileView extends StatelessWidget {
  final UserModel userModel;

  const ProfileView({super.key, required this.userModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: AppPaddings.defaultHomePadding,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DefaultAppBar(userModel: userModel),
                SizedBox(height: 37.h),
                ListSetting(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
