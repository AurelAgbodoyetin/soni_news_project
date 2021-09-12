import 'package:dartz/dartz.dart';
import 'package:soni_news_project/models/article.dart';
import 'package:soni_news_project/services/errors/app_errors.dart';

abstract class SqfLiteHelper {
  Future<Either<AppError, Unit>> open();
  Future<Either<AppError, Unit>> close();
  Future<Either<AppError, Article>> insert(Article article);
  Future<Either<AppError, List<Article>?>> getAllArticle();
  Future<Either<AppError, int?>> delete(int id);
}
