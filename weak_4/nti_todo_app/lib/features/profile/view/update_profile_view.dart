import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nti_todo_app/core/utils/app_paddings.dart';

import '../../../core/widgets/default_btn.dart';
import '../../../core/widgets/default_form_field.dart';

class UpdateProfileView extends StatelessWidget {
   UpdateProfileView({super.key});
  TextEditingController userName = TextEditingController();

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
                    controller: userName,
                    hintText: "Username",
                    // prefixIcon: IconButton(onPressed: null,
                    //     icon: SvgPicture.asset(AppAssets.profileIcon)),
                  ),
                  SizedBox(height: 12.h,),
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
