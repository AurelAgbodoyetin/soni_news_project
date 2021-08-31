import 'package:dartz/dartz.dart';
import 'package:soni_news_project/services/errors/app_errors.dart';

abstract class SharedPrefsHelper {
  Future<Either<AppError, bool>> getIsSeen();
  Future<Either<AppError, int>> getNReadArticles();
  Future<Either<AppError, int>> getNOfflineArticles();
  Future<Either<AppError, int>> getNOnlineArticles();
  Future<Either<AppError, Unit>> updateNReadArticles();
  Future<Either<AppError, Unit>> updateNOfflineArticles();
  Future<Either<AppError, Unit>> updateNOnlineArticles();
}
