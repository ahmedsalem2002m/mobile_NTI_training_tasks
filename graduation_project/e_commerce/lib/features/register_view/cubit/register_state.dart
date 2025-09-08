import '../../login_view/data/models/login_response_model.dart';

abstract class RegisterState{}
class InitialState extends RegisterState{}
class ChangeVisibility extends RegisterState{}

class RegisterLoading extends RegisterState{}

class RegisterSuccess extends RegisterState{

}
class RegisterError extends RegisterState{
  String error;

  RegisterError({required this.error});
}