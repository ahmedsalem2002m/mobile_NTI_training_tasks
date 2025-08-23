import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_todo_app/features/register/cubit/register_state.dart';
import 'package:nti_todo_app/features/register/data/repo/register_repo.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(InitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);
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

  void onPressRegister() async {
    if(!formKey.currentState!.validate()){
      return;
    }
    emit(LoadingRegister());
    RegisterRepo registerRepo = RegisterRepo();
    var result = await registerRepo.register(
      name: usernameController.text,
      email: emailController.text,
      password: passwordController.text,
    );
    if (result) {
      emit(SuccessRegister());
    } else {
      emit(ErrorRegister(error: "Error in registration"));
    }
  }

  // bool validateForm() {
  //   if (usernameController.text.isEmpty) {
  //     emit(ErrorRegister(error: "Username is required"));
  //     return false;
  //   }
  //
  //   if (emailController.text.isEmpty || !emailController.text.contains('@')) {
  //     emit(ErrorRegister(error: "Valid email is required"));
  //     return false;
  //   }
  //
  //   if (passwordController.text.isEmpty || passwordController.text.length < 6) {
  //     emit(ErrorRegister(error: "Password must be at least 6 characters"));
  //     return false;
  //   }
  //
  //   if (confirmController.text.isEmpty) {
  //     emit(ErrorRegister(error: "Please confirm your password"));
  //     return false;
  //   }
  //
  //   if (confirmController.text != passwordController.text) {
  //     emit(ErrorRegister(error: "Passwords do not match"));
  //     return false;
  //   }
  //
  //
  //   return true;
  // }

}
