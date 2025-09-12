import 'package:e_commerce/core/helper/app_navigator.dart';
import 'package:e_commerce/core/helper/app_pop_up.dart';
import 'package:e_commerce/core/helper/app_validator.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_paddings.dart';
import 'package:e_commerce/core/widgets/default_btn.dart';
import 'package:e_commerce/features/login_view/cubit/login_cubit.dart';
import 'package:e_commerce/navigation_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/widgets/default_text_form_field.dart';
import '../cubit/login_state.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
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
          child: BlocConsumer<LoginCubit, LoginState>(
            listener: (context, state) {
              if (state is LoginSuccess) {
                AppNavigator.goTo(
                  context,
                  NavigationView(),
                  type: NavigatorType.pushReplacement,
                );
              } else if (state is LoginError) {
                AppPopUp.showSnackBar(state.error, context);
              }
            },
            builder: (context, state) {
              return Form(
                key: LoginCubit.get(context).formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 42.h),
                    Text("Welcome\n Back!", style: TextStyle(fontSize: 36.sp)),
                    SizedBox(height: 45.h),
                    DefaultTextFormField(
                      validator: AppValidator.emailValidator,
                      controller: LoginCubit.get(context).emailController,
                      hintText: "Email",
                      prefixIcon: Icon(Icons.email),
                    ),
                    SizedBox(height: 22.h),
                    DefaultTextFormField(
                      validator: AppValidator.passwordValidator,
                      obscureText: LoginCubit.get(context).showPassword,
                      suffixIcon: GestureDetector(
                        onTap: () {
                          LoginCubit.get(context).changeVisibility();
                        },
                        child: LoginCubit.get(context).showPassword
                            ? IconButton(
                                onPressed: null,
                                icon: Icon(Icons.visibility_off),
                              )
                            : IconButton(
                                onPressed: null,
                                icon: Icon(Icons.visibility),
                              ),
                      ),
                      controller: LoginCubit.get(context).passwordController,
                      hintText: "Password",
                      prefixIcon: Icon(Icons.lock),
                    ),
                    SizedBox(height: 56.h),
                    state is LoginLoading
                        ? Center(child: CircularProgressIndicator())
                        : Container(
                            width: double.infinity,
                            height: 55,
                            color: AppColors.colorButton,
                            child: DefaultBtn(titleButton: "Login",onPressed: (){
                              LoginCubit.get(context).onPressLogin();
                            },),
                          ),

                    // SizedBox(height: 22.h,),
                    // DefaultText(
                    //   text_2: "Register",
                    //   text_1: "Don't",
                    //   onTap: () => AppNavigator.goTo(
                    //     context,
                    //     RegisterView(),
                    //   ),
                    // ),
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
