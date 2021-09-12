import 'package:soni_news_project/services/errors/app_errors.dart';
import 'package:dartz/dartz.dart';
import 'package:soni_news_project/services/prefs_helper/prefs_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsHelperImpl implements SharedPrefsHelper {
  @override
  Future<Either<AppError, bool>> getIsSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    late bool isSeen;
    try {
      isSeen = prefs.getBool('isSeen') ?? false;
    } catch (e) {
      return left(AppError.UNEXPECTED);
    }
    return right(isSeen);
  }

  @override
  Future<Either<AppError, int>> getNOfflineArticles() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    late int n;
    try {
      n = prefs.getInt('offline') ?? 0;
    } catch (e) {
      return left(AppError.UNEXPECTED);
    }
    return right(n);
  }

  @override
  Future<Either<AppError, int>> getNOnlineArticles() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    late int n;
    try {
      n = prefs.getInt('online') ?? 0;
    } catch (e) {
      return left(AppError.UNEXPECTED);
    }
    return right(n);
  }

  @override
  Future<Either<AppError, int>> getNReadArticles() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    late int n;
    try {
      n = prefs.getInt('read') ?? 0;
    } catch (e) {
      return left(AppError.UNEXPECTED);
    }
    return right(n);
  }

  @override
  Future<Either<AppError, Unit>> updateNOfflineArticles() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      int n = prefs.getInt('offline') ?? 0;
      await prefs.setInt('offline', n + 1);
    } catch (e) {
      return left(AppError.UNEXPECTED);
    }
    return right(unit);
  }

  @override
  Future<Either<AppError, Unit>> updateNOnlineArticles() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      int n = prefs.getInt('online') ?? 0;

      await prefs.setInt('online', n + 1);
    } catch (e) {
      return left(AppError.UNEXPECTED);
    }
    return right(unit);
  }

  @override
  Future<Either<AppError, Unit>> updateNReadArticles() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      int n = prefs.getInt('read') ?? 0;
      await prefs.setInt('read', n + 1);
    } catch (e) {
      return left(AppError.UNEXPECTED);
    }
    return right(unit);
  }

  @override
  Future<Either<AppError, Unit>> updateIsSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      await prefs.setBool('isSeen', true);
    } catch (e) {
      return left(AppError.UNEXPECTED);
    }
    return right(unit);
  }
}
