import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_todo_app/features/profile/cubit/language_cubit/language_state.dart';

class LanguageCubit extends Cubit<LanguageState>{
  LanguageCubit() : super(InitialState());
  static LanguageCubit get(context)=>BlocProvider.of(context);
  bool changeLanguage = true;

  void changeLan(){
    changeLanguage = !changeLanguage;
    emit(ChangeLanguageState());
  }

}