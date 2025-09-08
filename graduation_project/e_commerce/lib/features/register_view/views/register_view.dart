import 'package:e_commerce/core/helper/app_navigator.dart';
import 'package:e_commerce/core/helper/app_validator.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_paddings.dart';
import 'package:e_commerce/core/widgets/default_btn.dart';
import 'package:e_commerce/features/login_view/views/login_view.dart';
import 'package:e_commerce/features/register_view/cubit/register_cubit.dart';
import 'package:e_commerce/features/register_view/cubit/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/helper/app_pop_up.dart';
import '../../../core/widgets/default_text_form_field.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.textColorPrimary,
          leading: IconButton(
            onPressed: () {
              AppNavigator.goBack(context);
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
        ),
        body: Padding(
          padding: AppPaddings.appPaddingSecondary,
          child: BlocConsumer<RegisterCubit, RegisterState>(
            listener: (context, state) {
              if (state is RegisterSuccess) {
                AppNavigator.goTo(
                  context,
                  LoginView(),
                  type: NavigatorType.pushReplacement,
                );
              } else if (state is RegisterError) {
                AppPopUp.showSnackBar(state.error, context);
              }
            },
            builder: (context, state) {
              return SingleChildScrollView(
                child: Form(
                  key: RegisterCubit.get(context).formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 39.h),
                      Text(
                        "Create an\n account",
                        style: TextStyle(fontSize: 36.sp),
                      ),
                      SizedBox(height: 33.h),
                      DefaultTexFormField(
                        validator: AppValidator.requiredValidator,
                        controller: RegisterCubit.get(
                          context,
                        ).usernameController,
                        hintText: "Full Name",
                        prefixIcon: Icon(Icons.person),
                      ),
                      SizedBox(height: 10.h),
                      DefaultTexFormField(
                        validator: AppValidator.requiredValidator,
                        controller: RegisterCubit.get(context).phoneController,
                        hintText: "Phone",
                        prefixIcon: Icon(Icons.phone_sharp),
                      ),
                      SizedBox(height: 10.h),
                      DefaultTexFormField(
                        validator: AppValidator.emailValidator,
                        controller: RegisterCubit.get(context).emailController,
                        hintText: "Email",
                        prefixIcon: Icon(Icons.email),
                      ),
                      SizedBox(height: 10.h),
                      DefaultTexFormField(
                        validator: AppValidator.passwordValidator,
                        obscureText: RegisterCubit.get(context).showPassword,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            RegisterCubit.get(
                              context,
                            ).changePasswordVisibility();
                          },
                          child: RegisterCubit.get(context).showPassword
                              ? IconButton(
                                  onPressed: null,
                                  icon: Icon(Icons.visibility_off),
                                )
                              : IconButton(
                                  onPressed: null,
                                  icon: Icon(Icons.visibility),
                                ),
                        ),
                        controller: RegisterCubit.get(
                          context,
                        ).passwordController,
                        hintText: "Password",
                        prefixIcon: Icon(Icons.lock),
                      ),
                      SizedBox(height: 10.h),
                      DefaultTexFormField(
                        validator: (value) =>
                            AppValidator.confirmPasswordValidator(
                              value,
                              RegisterCubit.get(
                                context,
                              ).passwordController.text,
                            ),
                        obscureText: RegisterCubit.get(
                          context,
                        ).showConfirmPassword,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            RegisterCubit.get(
                              context,
                            ).changeConfirmPasswordVisibility();
                          },
                          child: RegisterCubit.get(context).showConfirmPassword
                              ? IconButton(
                                  onPressed: null,
                                  icon: Icon(Icons.visibility_off),
                                )
                              : IconButton(
                                  onPressed: null,
                                  icon: Icon(Icons.visibility),
                                ),
                        ),
                        controller: RegisterCubit.get(
                          context,
                        ).confirmController,
                        hintText: "Confirm Password",
                        prefixIcon: Icon(Icons.lock),
                      ),
                      // SizedBox(height: 21.h,),
                      // Text(
                      //   "By clicking the Register button, you agree\n to the public offer",
                      //   style: TextStyle(
                      //
                      //   ),
                      // )
                      SizedBox(height: 56.h),
                      state is RegisterLoading
                          ? Center(child: CircularProgressIndicator())
                          : Container(
                              width: double.infinity,
                              height: 55,
                              color: AppColors.colorButton,
                              child: DefaultBtn(
                                titleButton: "Create Account",
                                onPressed: () {
                                  RegisterCubit.get(
                                    context,
                                  ).onRegisterPressed();
                                },
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
