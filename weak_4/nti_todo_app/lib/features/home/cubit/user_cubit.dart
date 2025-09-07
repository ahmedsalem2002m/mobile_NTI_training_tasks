import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_todo_app/features/home/cubit/user_state.dart';

import '../../login/data/model/login_response_model.dart';
import '../data/repo/home_repo.dart';

class UserCubit extends Cubit<UserState>
{
  UserCubit(): super(UserInitial());
  static UserCubit get(context) => BlocProvider.of(context);


  controlUser(UserModel? userModel){
    if(userModel == null){
      getUser();
    }else{
      emit(UserSuccess(userModel: userModel));
    }
  }
  getUser()async
  {
    HomeRepo homeRepo = HomeRepo();
    emit(UserLoading());
    var response = await homeRepo.getUser();
    response.fold(
            (error)=> emit(UserError(error: error)),
            (user) => emit(UserSuccess(userModel: user)));
  }

}


