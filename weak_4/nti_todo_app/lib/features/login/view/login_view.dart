import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nti_todo_app/core/helper/app_navigator.dart';
import 'package:nti_todo_app/core/helper/app_validator.dart';
import 'package:nti_todo_app/core/widgets/default_form_field.dart';
import 'package:nti_todo_app/features/login/cubit/login_cubit.dart';
import 'package:nti_todo_app/features/login/cubit/login_state.dart';
import 'package:nti_todo_app/features/register/view/register_view.dart';
import 'package:nti_todo_app/features/register/view/widgets/defualt_text.dart';

import '../../../../core/widgets/default_btn.dart';
import '../../../core/helper/app_pick-time.dart';
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
                child: Form(
                  key: LoginCubit.get(context).formKey,
                  child: Column(
                    children: [
                      Image.asset("assets/images/flag.png"),
                      Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          spacing: 8,
                          children: [
                            DefaultFormField(
                              validator: AppValidator.emailValidator,
                              controller: LoginCubit.get(
                                context,
                              ).emailController,
                              hintText: "Email",
                              prefixIcon: IconButton(
                                onPressed: null,
                                icon: Icon(Icons.email_outlined),
                              ),
                            ),
                            BlocConsumer<LoginCubit, LoginState>(
                              listener:(context, state){
                                if(state is LoginSuccess){
                                  AppNavigator.goTo(context, HomeView());
                                }
                              },
                              builder: (context, state) {
                                return DefaultFormField(
                                  validator: AppValidator.passwordValidator,
                                  obscureText: LoginCubit.get(
                                    context,
                                  ).showPassword,
                                  suffixIcon: GestureDetector(
                                    onTap: () {
                                      LoginCubit.get(
                                        context,
                                      ).changeVisibility();
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
                                  controller: LoginCubit.get(
                                    context,
                                  ).passwordController,
                                  hintText: "Password",
                                  prefixIcon: IconButton(
                                    onPressed: null,
                                    icon: SvgPicture.asset(AppAssets.keyIcon),
                                  ),
                                );
                              },
                            ),
                            SizedBox(height: 4),
                            DefaultBtn(
                              onPressed: () =>
                                  LoginCubit.get(context).onPress(),
                              text: "Login",
                            ),
                            DefaultText(
                              text_2: "Register",
                              text_1: "Don't",
                              onTap: () => AppNavigator.goTo(context, RegisterView()),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
