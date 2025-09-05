import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_todo_app/features/register/cubit/register_state.dart';
import 'package:nti_todo_app/features/register/data/repo/register_repo.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(InitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);

 // XFile? image;
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

  // onRegisterPressed()async
  // {
  //   if(!formKey.currentState!.validate())
  //   {
  //     return;
  //   }
  //   emit(LoadingRegister());
  //   RegisterRepo repo = RegisterRepo();
  //   var response = await repo.register(
  //       name: usernameController.text,
  //       email: emailController.text,
  //       password: passwordController.text
  //   );
  //   response.fold(
  //           (String error)=> emit(ErrorRegister(error: error)),
  //           (userModel)=> emit(SuccessRegister(userModel: userModel))
  //   );
  // }

  onRegisterPressed()async
  {
    if(!formKey.currentState!.validate())
    {
      return;
    }
    emit(LoadingRegister());
    RegisterRepo repo = RegisterRepo();
    var response = await repo.register(
        phone: phoneController.text,
        name: usernameController.text,
        email: emailController.text,
        password: passwordController.text,
        //image: image
    );
    response.fold(
            (String error)=> emit(ErrorRegister(error: error)),
            (userModel)=> emit(SuccessRegister())
    );
  }


}
