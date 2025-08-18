import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_todo_app/features/login/cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState>{
  LoginCubit():super(InitialState());
  static LoginCubit get(context)=>BlocProvider.of(context);
  bool showPassword = false;

  void changeVisibility(){
    showPassword = !showPassword;
    emit(ChangeVisibility());
  }

}