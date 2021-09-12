import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:soni_news_project/models/article.dart';
import 'package:soni_news_project/services/dio_helper/dio_helper.dart';
import 'package:soni_news_project/services/dio_helper/dio_helper_impl.dart';
import 'package:soni_news_project/services/errors/app_errors.dart';
import 'package:soni_news_project/utils/error_snackbar.dart';

class SearchController extends GetxController {
  static SearchController instance = Get.find();
//TODO Review this controller
  RxBool isLoading = false.obs;
  DioHelper _helper = DioHelperImpl();
  RxList<Article> articles = <Article>[].obs;

  Future getArticles(String term) async {
    isLoading.value = true;
    Either<AppError, List<Article>> _articlesEither =
        await _helper.getSearchResults(term, "en");
    isLoading.value = false;
    _articlesEither.fold(
      (error) {
        return showErrorSnackbar(error);
      },
      (gotArticles) {
        articles.value = gotArticles;
      },
    );
  }
}
