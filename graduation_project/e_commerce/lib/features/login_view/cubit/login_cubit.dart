import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState>{
  LoginCubit():super(InitialState());
  static  LoginCubit get(context)=>BlocProvider.of(context);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>() ;
  bool showPassword = true;


  void changeVisibility(){
    showPassword = !showPassword;
    emit(ChangeVisibility());
  }

}