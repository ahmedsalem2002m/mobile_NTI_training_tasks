import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_todo_app/features/login/cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState>{
  LoginCubit():super(InitialState());
  static LoginCubit get(context)=>BlocProvider.of(context);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool showPassword = true;

  void changeVisibility(){
    showPassword = !showPassword;
    emit(ChangeVisibility());
  }

}