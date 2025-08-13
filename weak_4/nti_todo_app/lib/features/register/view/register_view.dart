import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nti_todo_app/core/helper/my_navigator.dart';
import 'package:nti_todo_app/core/utils/app_assets.dart';
import 'package:nti_todo_app/core/widgets/default_form_field.dart';
import 'package:nti_todo_app/features/home/view/home_view.dart';
import 'package:nti_todo_app/features/register/view/widgets/defualt_text.dart';

import '../../../../core/widgets/default_btn.dart';
import '../../login/view/login_view.dart';

class RegisterView extends StatefulWidget {
  RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  bool lock_1 = true;
  bool lock_2 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset("assets/images/flag.png"),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  spacing: 8,
                  children: [
                  DefaultFormField(
                  controller: password,
                  hintText: "Username",
                  prefixIcon: IconButton(onPressed: null,
                      icon: SvgPicture.asset(AppAssets.profileIcon)),
                ),
                DefaultFormField(
                  obscureText: lock_1,
                  suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          lock_1 = !lock_1;
                        });
                      },
                      child: lock_1
                          ? IconButton(onPressed: null,
                          icon: SvgPicture.asset(AppAssets.lockIcon))
                          : IconButton(onPressed: null,
                          icon: SvgPicture.asset(AppAssets.unlockIcon))),
                  controller: userName,
                  hintText: "Password",
                  prefixIcon: IconButton(onPressed: null,
                      icon: SvgPicture.asset(AppAssets.keyIcon)),
                ),
                DefaultFormField(
                  obscureText: lock_2,
                  controller: confirmPassword,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        lock_2 = !lock_2;
                      });
                    },
                    child: lock_2
                        ? IconButton(onPressed: null,
                        icon: SvgPicture.asset(AppAssets.lockIcon))
                        : IconButton(onPressed: null,
                        icon: SvgPicture.asset(AppAssets.unlockIcon))),
                    hintText: "Confirm Password",
                    prefixIcon: IconButton(onPressed: null,
                        icon: SvgPicture.asset(AppAssets.keyIcon)),
                  ),
                  SizedBox(height: 4),
                  DefaultBtn(onPressed: () =>goTo(context, HomeView()), text: "Register"),
                  DefaultText(text_2: "Login", text_1: "Already", onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginView()));
                  },),
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
