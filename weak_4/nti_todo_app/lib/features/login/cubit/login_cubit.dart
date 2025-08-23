import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_todo_app/features/login/cubit/login_state.dart';
import 'package:nti_todo_app/features/login/data/repo/login_repo.dart';

class LoginCubit extends Cubit<LoginState>{
  LoginCubit():super(InitialState());
  static LoginCubit get(context)=>BlocProvider.of(context);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>() ;
  bool showPassword = true;

  void changeVisibility(){
    showPassword = !showPassword;
    emit(ChangeVisibility());
  }

  // void onPress(){
  //   if(!formKey.currentState!.validate()){
  //     return;
  //   }
  //   emit(LoginSuccess());
  // }
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