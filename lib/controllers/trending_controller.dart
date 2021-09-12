import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:soni_news_project/models/article.dart';
import 'package:soni_news_project/services/core/api.dart';
import 'package:soni_news_project/services/dio_helper/dio_helper.dart';
import 'package:soni_news_project/services/dio_helper/dio_helper_impl.dart';
import 'package:soni_news_project/services/errors/app_errors.dart';
import 'package:soni_news_project/utils/error_snackbar.dart';

class TrendingController extends GetxController {
  static TrendingController instance = Get.find();
  DioHelper _helper = DioHelperImpl();
  RxList<Article> articles = <Article>[].obs;
  RxBool isLoading = false.obs;

  @override
  void onReady() async {
    await getArticles();
    super.onReady();
  }

  Future getArticles() async {
    isLoading.value = true;
    Either<AppError, List<Article>> _articlesEither =
        await _helper.getTrending("en");
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
