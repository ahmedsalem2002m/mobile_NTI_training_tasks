import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:news_app/features/explore_view/data/models/articles_respones_model.dart';

class NewsRepo {

  Future<Either<String, ArticlesResponseModels>> getNews(
      {String? searchKeyWord = "sport"}) async {

    try {
      Dio dio = Dio();
      var response = await dio.get("https://newsapi.org/v2/everything?q=$searchKeyWord&apiKey=a426c5614f414130a6db375ce60f325d");
      ArticlesResponseModels articlesResponseModels =
          ArticlesResponseModels.fromJson(
            response.data as Map<String, dynamic>,
          );
      return Right(articlesResponseModels);
    }on DioException catch(e)
    {
      var errorResponse = e.response?.data as Map<String, dynamic>;

      print(errorResponse['message']);
      return Left(errorResponse['message']);
    }
    catch (e) {
      return Left(e.toString());
    }
  }
}
