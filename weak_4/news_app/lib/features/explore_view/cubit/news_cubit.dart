import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/explore_view/cubit/news_state.dart';
import 'package:news_app/features/explore_view/data/repo/news_repo.dart';

class NewsCubit extends Cubit<NewsState>{
  NewsCubit():super(InitialState());
  static NewsCubit get(context)=>BlocProvider.of(context);
  TextEditingController searchKeyWord = TextEditingController();

  getNews()async{
    NewsRepo newsRepo= NewsRepo();
    emit(NewsLoading());
    var response =await newsRepo.getNews();
    response.fold(
        (error)=>emit(NewsError(error)),
        (articlesResponseModels)=>emit(NewsSuccess(articlesResponseModels))
    );

  }
  getNewsBySearch()async{
    NewsRepo newsRepo= NewsRepo();
    emit(NewsLoading());
    var response =await newsRepo.getNews(searchKeyWord: searchKeyWord.text);
    response.fold(
        (error)=>emit(NewsError(error)),
        (articlesResponseModels)=>emit(NewsSuccess(articlesResponseModels))
    );

  }

}