import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_todo_app/features/register/cubit/register_state.dart';
import 'package:nti_todo_app/features/register/data/repo/register_repo.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(InitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);
  TextEditingController passwordCotroller = TextEditingController();
  TextEditingController confirmCotroller = TextEditingController();
  TextEditingController usernameCotroller = TextEditingController();
  TextEditingController emailCotroller = TextEditingController();
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
    emit(LoadingRegister());
    RegisterRepo registerRepo = RegisterRepo();
    var result = await registerRepo.register(
      name: usernameCotroller.text,
      email: emailCotroller.text,
      password: passwordCotroller.text,
    );
    if (result) {
      emit(SuccessRegister());
    } else {
      emit(ErrorRegister(error: "Error in registration"));
    }
  }

  bool validateForm() {
    if (usernameCotroller.text.isEmpty) {
      emit(ErrorRegister(error: "Username is required"));
      return false;
    }

    if (emailCotroller.text.isEmpty || !emailCotroller.text.contains('@')) {
      emit(ErrorRegister(error: "Valid email is required"));
      return false;
    }

    if (passwordCotroller.text.isEmpty || passwordCotroller.text.length < 6) {
      emit(ErrorRegister(error: "Password must be at least 6 characters"));
      return false;
    }

    if (confirmCotroller.text.isEmpty) {
      emit(ErrorRegister(error: "Please confirm your password"));
      return false;
    }

    if (confirmCotroller.text != passwordCotroller.text) {
      emit(ErrorRegister(error: "Passwords do not match"));
      return false;
    }


    return true;
  }

}
