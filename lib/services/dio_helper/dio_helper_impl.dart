import 'package:dio/dio.dart';
import 'package:soni_news_project/models/article.dart';
import 'package:dartz/dartz.dart';
import 'package:soni_news_project/services/core/api.dart';
import 'package:soni_news_project/services/dio_helper/dio_helper.dart';
import 'package:soni_news_project/services/errors/app_errors.dart';

class DioHelperImpl implements DioHelper {
  late final Dio _dio;

  DioHelperImpl() {
    _dio = Dio();
  }

  @override
  Future<Either<AppError, List<Article>>> getHeadlines(String category,
      {String sortBy = 'relevancy', String lang = "en"}) async {
    String _url = makeCategoryHeadlinesUrl(
      category: category,
      sortBy: sortBy,
      lang: lang,
    );
    return callApi(_url);
  }

  @override
  Future<Either<AppError, List<Article>>> getSearchResults(
    String q,
    String lang,
  ) {
    String _url = makeSearchUrl(q: q, lang: lang);
    return callApi(_url);
  }

  @override
  Future<Either<AppError, List<Article>>> getTrending(String lang) {
    String _url = makeTrendingUrl(lang: lang);
    return callApi(_url);
  }

  @override
  Future<Either<AppError, List<Article>>> callApi(String url) async {
    Future<Response> _response;
    late Response _responseAwaited;
    try {
      _response = _dio.get(url);
      _responseAwaited = await _response;
    } on DioError catch (e) {
      if (e.message.contains("SocketException")) {
        return left(AppError.SOCKET);
      } else {
        if (e.response!.data["code"] == "apiKeyDisabled") {
          return left(AppError.DISABLED);
        } else {
          if (e.response!.data["code"] == "apiKeyExhausted") {
            return left(AppError.EXHAUSTED);
          } else {
            if (e.response!.data["code"] == "apiKeyInvalid") {
              return left(AppError.INVALID_API_KEY);
            } else {
              if (e.response!.data["code"] == "unexpectedError") {
                return left(AppError.UNEXPECTED);
              }
            }
          }
        }
      }
    } catch (e) {
      return left(AppError.UNEXPECTED);
    }
    return right(
      List<Article>.from(
        _responseAwaited.data["articles"]!.map(
          (dynamic articleMap) => Article.fromMap(articleMap),
        ),
      ),
    );
  }
}
