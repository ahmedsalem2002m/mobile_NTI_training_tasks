import 'package:news_app/features/explore_view/data/models/articles_respones_model.dart';

abstract class NewsState{}
class InitialState extends NewsState{}
class NewsLoading extends NewsState{}
class NewsSuccess extends NewsState{
  ArticlesResponseModels articlesResponseModels;

  NewsSuccess(this.articlesResponseModels);
}
class NewsError extends NewsState{
  String error;

  NewsError(this.error);
}