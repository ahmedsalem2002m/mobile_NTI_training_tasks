import 'package:flutter/material.dart';
import 'package:nti_todo_app/core/helper/my_navigator.dart';
import 'package:nti_todo_app/features/register/view/register_view.dart';

import '../../home/view/home_view.dart';

class UpdateProfileView extends StatelessWidget {
  const UpdateProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [Image.asset("assets/images/flag.png"),

          ]),
        ),
      ),
    );
  }
}
