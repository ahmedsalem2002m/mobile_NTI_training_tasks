import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nti_todo_app/core/helper/app_navigator.dart';
import 'package:nti_todo_app/core/helper/app_validator.dart';
import 'package:nti_todo_app/core/helper/app_pick-time.dart';
import 'package:nti_todo_app/core/utils/app_assets.dart';
import 'package:nti_todo_app/core/widgets/default_form_field.dart';
import 'package:nti_todo_app/features/home/view/home_view.dart';
import 'package:nti_todo_app/features/register/cubit/register_cubit.dart';
import 'package:nti_todo_app/features/register/cubit/register_state.dart';
import 'package:nti_todo_app/features/register/view/widgets/defualt_text.dart';

import '../../../../core/widgets/default_btn.dart';
import '../../login/view/login_view.dart';

class RegisterView extends StatelessWidget {
  RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Builder(
              builder: (context) {
                return BlocConsumer<RegisterCubit, RegisterState>(
                  listener: (context, state) {
                    if (state is SuccessRegister) {
                      AppNavigator.goTo(context, HomeView());
                    } else if (state is ErrorRegister) {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text(state.error)));
                    }
                  },
                  builder: (context, state) {
                    return Form(
                      key: RegisterCubit.get(context).formKey,
                      child: Column(
                        children: [
                          Image.asset("assets/images/flag.png"),
                          Padding(
                            padding: const EdgeInsets.all(24.0),
                            child: Column(
                              spacing: 8,
                              children: [
                                DefaultFormField(
                                  controller: RegisterCubit.get(
                                    context,
                                  ).usernameController,
                                  hintText: "Username",
                                  prefixIcon: IconButton(
                                    onPressed: null,
                                    icon: SvgPicture.asset(
                                      AppAssets.profileIcon,
                                    ),
                                  ),
                                ),
                                DefaultFormField(
                                  validator: AppValidator.emailValidator,
                                  controller: RegisterCubit.get(
                                    context,
                                  ).emailController,
                                  hintText: "Email",
                                  prefixIcon: IconButton(
                                    onPressed: null,
                                    icon: Icon(Icons.email_outlined),
                                  ),
                                ),
                                DefaultFormField(
                                  validator: AppValidator.passwordValidator,
                                  obscureText: RegisterCubit.get(
                                    context,
                                  ).showPassword,
                                  suffixIcon: GestureDetector(
                                    onTap: () {
                                      RegisterCubit.get(
                                        context,
                                      ).changePasswordVisibility();
                                    },
                                    child:
                                        RegisterCubit.get(context).showPassword
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
                                  controller: RegisterCubit.get(
                                    context,
                                  ).passwordController,
                                  hintText: "Password",
                                  prefixIcon: IconButton(
                                    onPressed: null,
                                    icon: SvgPicture.asset(AppAssets.keyIcon),
                                  ),
                                ),
                                DefaultFormField(
                                  validator: (value) => AppValidator.confirmPasswordValidator(value, RegisterCubit.get(context).confirmController.text),
                                  obscureText: RegisterCubit.get(
                                    context,
                                  ).showConfirmPassword,
                                  controller: RegisterCubit.get(
                                    context,
                                  ).confirmController,
                                  suffixIcon: GestureDetector(
                                    onTap: () {
                                      RegisterCubit.get(
                                        context,
                                      ).changeConfirmPasswordVisibility();
                                    },
                                    child:
                                        RegisterCubit.get(
                                          context,
                                        ).showConfirmPassword
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
                                  hintText: "Confirm Password",
                                  prefixIcon: IconButton(
                                    onPressed: null,
                                    icon: SvgPicture.asset(AppAssets.keyIcon),
                                  ),
                                ),
                                SizedBox(height: 4),
                                state is LoadingRegister
                                    ? CircularProgressIndicator()
                                    : DefaultBtn(
                                        onPressed: () {
                                          RegisterCubit.get(
                                            context,
                                          ).onPressRegister();
                                        },
                                        text: "Register",
                                      ),
                                DefaultText(
                                  text_2: "Login",
                                  text_1: "Already",
                                  onTap: () => AppNavigator.goTo(context, LoginView()),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
