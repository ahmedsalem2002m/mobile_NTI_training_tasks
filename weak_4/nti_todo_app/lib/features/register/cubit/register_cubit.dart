import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_todo_app/features/register/cubit/register_state.dart';

class RegisterCubit extends Cubit<RegisterState>{
  RegisterCubit():super(InitialState());
  static RegisterCubit get(context)=>BlocProvider.of(context);
  TextEditingController passwordCotroller= TextEditingController();
  TextEditingController confirmCotroller= TextEditingController();
  TextEditingController usernameCotroller= TextEditingController();
  TextEditingController emailCotroller= TextEditingController();
  bool showPassword = true;
  bool showConfirmPassword = true;

  void changePasswordVisibility(){
    showPassword = !showPassword;
    emit(ChangeVisibility());
  }
  void changeConfirmPasswordVisibility(){
    showConfirmPassword = !showConfirmPassword;
    emit(ChangeVisibility());
  }

}