import 'package:e_commerce/core/helper/app_navigator.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_paddings.dart';
import 'package:e_commerce/core/widgets/default_btn.dart';
import 'package:e_commerce/features/register_view/cubit/register_cubit.dart';
import 'package:e_commerce/features/register_view/cubit/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/widgets/default_text_form_field.dart';
import '../../login_view/cubit/login_state.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>RegisterCubit(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.textColorPrimary,
          leading: IconButton(
            onPressed: (){
              AppNavigator.goBack(context);
            },
            icon:Icon(Icons.arrow_back_ios),
          ),
        ),
        body: Padding(
          padding: AppPaddings.appPaddingSecondary,
          child: BlocConsumer<RegisterCubit,RegisterState>(
            listener: (context,state){

            },
            builder: (context,state){
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 39.h,),
                    Text(
                      "Create an\n account",
                      style: TextStyle(
                          fontSize: 36.sp
                      ),
                    ),
                    SizedBox(height: 33.h,),
                    DefaultTexFormField(controller: RegisterCubit.get(context).usernameController,hintText: "Full Name",prefixIcon: Icon(Icons.person),),
                    SizedBox(height: 10.h,),
                    DefaultTexFormField(controller: RegisterCubit.get(context).phoneController,hintText: "Phone",prefixIcon: Icon(Icons.phone_sharp),),
                    SizedBox(height: 10.h,),
                    DefaultTexFormField(controller: RegisterCubit.get(context).emailController,hintText: "Email",prefixIcon: Icon(Icons.email),),
                    SizedBox(height: 10.h,),
                    DefaultTexFormField(
                      obscureText: RegisterCubit.get(context).showPassword,
                      suffixIcon: GestureDetector(
                        onTap: () {
                          RegisterCubit.get(context).changePasswordVisibility();
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
                      controller: RegisterCubit.get(context).passwordController,
                      hintText: "Password",
                      prefixIcon: Icon(Icons.lock),
                    ),
                    SizedBox(height: 10.h,),
                    DefaultTexFormField(
                      obscureText:RegisterCubit.get(context).showConfirmPassword,
                      suffixIcon: GestureDetector(
                        onTap: () {
                          RegisterCubit.get(context).changeConfirmPasswordVisibility();
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
                      controller: RegisterCubit.get(context).confirmController,
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
                    SizedBox(height: 56.h,),
                    Container(
                      width: double.infinity,
                      height: 55,
                      color: AppColors.colorButton,
                      child: DefaultBtn(
                        titleButton: "Create Account",),
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
