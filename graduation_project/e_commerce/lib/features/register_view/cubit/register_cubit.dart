import 'package:e_commerce/features/register_view/cubit/register_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/repo/register_repo.dart';

class RegisterCubit extends Cubit<RegisterState>{

  RegisterCubit() : super(InitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool showPassword = true;
  bool showConfirmPassword = true;

  void changePasswordVisibility() {
    showPassword = !showPassword;
    emit(ChangeVisibility());
  }

  void changeConfirmPasswordVisibility() {
    showConfirmPassword = !showConfirmPassword;
    emit(ChangeVisibility());
  }

  onRegisterPressed()async
  {
    if(!formKey.currentState!.validate())
    {
      return;
    }
    emit(RegisterLoading());
    RegisterRepo repo = RegisterRepo();
    var response = await repo.register(
        phone: phoneController.text,
        userName: usernameController.text,
        email: emailController.text,
        password: passwordController.text,
    );
    response.fold(
            (String error)=> emit(RegisterError(error: error)),
            (userModel)=> emit(RegisterSuccess())
    );
  }
}