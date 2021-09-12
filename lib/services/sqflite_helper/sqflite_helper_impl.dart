import 'package:dartz/dartz.dart';
import 'package:path/path.dart';
import 'package:soni_news_project/models/article.dart';
import 'package:soni_news_project/services/errors/app_errors.dart';
import 'package:soni_news_project/services/sqflite_helper/core/sqflite_helper.dart';
import 'package:sqflite/sqflite.dart';

class SqfLiteHelperImpl implements SqfLiteHelper {
  Database? db;
  final String tName = "articles";

  Future<Either<AppError, Unit>> open() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'soniNewsApp.db');
    try {
      db = await openDatabase(
        path,
        version: 1,
        onCreate: (Database db, int version) async {
          await db.execute('''
        create table articles ( 
          id integer primary key autoincrement, 
          author text not null,
          title text not null,
          description text not null,
          url text,
          urlToImage text,
          publishedAt text,
          isOffline integer not null,
          isOnline integer not null,
          content text
          )
      ''');
        },
      );
    } catch (e) {
      return left(AppError.UNEXPECTED);
    }
    return right(unit);
  }

  Future<Either<AppError, Article>> insert(Article article) async {
    try {
      await open();
      article.id = await db?.insert(tName, article.toMap());
      await close();
    } catch (e) {
      return left(AppError.UNEXPECTED);
    }
    return right(article);
  }

  Future<Either<AppError, List<Article>?>> getAllArticle() async {
    List<Map<String, dynamic>?>? maps;
    try {
      await open();
      maps = await db?.query(tName);
      await close();
    } catch (e) {
      return left(AppError.UNEXPECTED);
    }
    return right(maps
        ?.map(
          (articleMap) => Article.fromMap(articleMap!),
        )
        .toList());
  }

  Future<Either<AppError, int?>> delete(int id) async {
    int? a;
    try {
      await open();
      a = await db?.delete(tName, where: 'id = ?', whereArgs: [id]);
      await close();
    } catch (e) {
      return left(AppError.UNEXPECTED);
    }
    return right(a);
  }

  Future<Either<AppError, Unit>> close() async {
    try {
      db?.close();
    } catch (e) {
      return left(AppError.UNEXPECTED);
    }
    return right(unit);
  }
}
