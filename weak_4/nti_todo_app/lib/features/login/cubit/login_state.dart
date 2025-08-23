abstract class LoginState{}
class InitialState extends LoginState{}
class ChangeVisibility extends LoginState{}
class LoginSuccess extends LoginState{}
class LoginError extends LoginState{
  String error;

  LoginError({required this.error});
}