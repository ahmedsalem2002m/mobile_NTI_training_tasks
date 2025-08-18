import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nti_todo_app/core/widgets/default_form_field.dart';
import 'package:nti_todo_app/features/login/cubit/login_cubit.dart';
import 'package:nti_todo_app/features/login/cubit/login_state.dart';
import 'package:nti_todo_app/features/register/view/register_view.dart';
import 'package:nti_todo_app/features/register/view/widgets/defualt_text.dart';

import '../../../../core/widgets/default_btn.dart';
import '../../../core/helper/my_navigator.dart';
import '../../../core/utils/app_assets.dart';
import '../../home/view/home_view.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  TextEditingController userName = TextEditingController();

  TextEditingController password = TextEditingController();

  TextEditingController confirmPassword = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Scaffold(
        body: SafeArea(
          child: Builder(
            builder: (context) {
              return SingleChildScrollView(
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
                            prefixIcon: IconButton(
                              onPressed: null,
                              icon: SvgPicture.asset(AppAssets.profileIcon),
                            ),
                          ),
                          BlocBuilder<LoginCubit,LoginState>(
                            builder: (context,state){
                              return DefaultFormField(
                                obscureText: LoginCubit.get(context).showPassword,
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    LoginCubit.get(context).changeVisibility();
                                  },
                                  child: LoginCubit.get(context).showPassword
                                      ? IconButton(
                                    onPressed: null,
                                    icon: SvgPicture.asset(
                                      AppAssets.lockIcon,
                                    ),
                                  )
                                      : IconButton(
                                    onPressed: null,
                                    icon: SvgPicture.asset(
                                      AppAssets.unlockIcon,
                                    ),
                                  ),
                                ),
                                controller: userName,
                                hintText: "Password",
                                prefixIcon: IconButton(
                                  onPressed: null,
                                  icon: SvgPicture.asset(AppAssets.keyIcon),
                                ),
                              );
                            }
                          ),
                          SizedBox(height: 4),
                          DefaultBtn(
                            onPressed: () => goTo(context, HomeView()),
                            text: "Login",
                          ),
                          DefaultText(
                            text_2: "Register",
                            text_1: "Don't",
                            onTap: () => goTo(context, RegisterView()),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
