import 'package:flutter_bloc/flutter_bloc.dart';

import 'language_state.dart';


class LanguageCubit extends Cubit<LanguageState>{
  LanguageCubit() : super(InitialState());
  static LanguageCubit get(context)=>BlocProvider.of(context);
  bool changeLanguage = true;

  void changeLan(){
    changeLanguage = !changeLanguage;
    emit(ChangeLanguageState());
  }

}