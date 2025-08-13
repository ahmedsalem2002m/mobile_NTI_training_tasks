import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/app_paddings.dart';
import '../../../core/widgets/default_btn.dart';
import '../../../core/widgets/default_form_field.dart';

class ChangePasswordView extends StatelessWidget {
  ChangePasswordView({super.key});
  TextEditingController oldPassword = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            Image.asset("assets/images/flag.png"),
            Padding(
              padding: AppPaddings.defaultHomePadding,
              child: Column(
                children: [
                  SizedBox(height: 23.h,),
                  DefaultFormField(
                    controller: oldPassword,
                    hintText: "Old password",
                    // prefixIcon: IconButton(onPressed: null,
                    //     icon: SvgPicture.asset(AppAssets.profileIcon)),
                  ),
                  SizedBox(height: 10.h,),
                  DefaultFormField(
                    controller: newPassword,
                    hintText: "New Password",
                    // prefixIcon: IconButton(onPressed: null,
                    //     icon: SvgPicture.asset(AppAssets.profileIcon)),
                  ),
                  SizedBox(height: 10.h,),
                  DefaultFormField(
                    controller: confirmPassword,
                    hintText: "Confirm Password",
                    // prefixIcon: IconButton(onPressed: null,
                    //     icon: SvgPicture.asset(AppAssets.profileIcon)),
                  ),
                  SizedBox(height: 10.h,),
                  DefaultBtn(onPressed: (){}, text: "Save"),

                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
