import '../data/models/login_response_model.dart';

abstract class LoginState{}
 class InitialState extends LoginState{}
 class ChangeVisibility extends LoginState{}

class LoginLoading extends LoginState{}

class LoginSuccess extends LoginState{
 UserModel? userModel;

 LoginSuccess({this.userModel});
}
class LoginError extends LoginState{
 String error;

 LoginError({required this.error});
}