import 'package:dartz/dartz.dart';
import 'package:soni_news_project/models/article.dart';
import 'package:soni_news_project/services/errors/app_errors.dart';

abstract class DioHelper {
  Future<Either<AppError, List<Article>>> getHeadlines(
    String category,
    String sortBy,
    String lang,
  );

  Future<Either<AppError, List<Article>>> getSearchResults(
    String q,
    String lang,
  );
  Future<Either<AppError, List<Article>>> getTrending(
    String lang,
  );

  Future<Either<AppError, List<Article>>> callApi(String url);
}
