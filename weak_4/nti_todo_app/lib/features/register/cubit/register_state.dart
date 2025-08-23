import '../../login/data/model/login_model.dart';

abstract class RegisterState{}
class InitialState extends RegisterState{}
class ChangeVisibility extends RegisterState{}
class LoadingRegister extends RegisterState{}
class SuccessRegister extends RegisterState{
  UserModel? userModel;

  SuccessRegister({this.userModel});
}
class ErrorRegister extends RegisterState{
  String error;

  ErrorRegister({required this.error});
}