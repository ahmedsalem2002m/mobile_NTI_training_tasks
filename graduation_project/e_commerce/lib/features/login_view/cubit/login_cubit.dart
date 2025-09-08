import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/repo/login_repo.dart';
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


  void onPressLogin()async
  {
    if(!formKey.currentState!.validate()) return;
    emit(LoginLoading());
    LoginRepo repo = LoginRepo();
    var loginResponse = await repo.login(
        email: emailController.text,
        password: passwordController.text
    );
    loginResponse.fold(
            (String error)=> emit(LoginError(error: error)),
            (userModel)=> emit(LoginSuccess(userModel: userModel))
    );

  }

}