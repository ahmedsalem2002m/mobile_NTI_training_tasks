
import '../../login/data/model/login_response_model.dart';

abstract class UserState{}

class UserInitial extends UserState{}
class UserLoading extends UserState{}
class UserSuccess extends UserState
{
  UserModel userModel;
  UserSuccess({required this.userModel});
}
class UserError extends UserState
{
  String error;
  UserError({required this.error});
}