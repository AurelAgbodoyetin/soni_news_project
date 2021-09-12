import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:soni_news_project/models/article.dart';
import 'package:soni_news_project/services/core/api.dart';
import 'package:soni_news_project/services/dio_helper/dio_helper.dart';
import 'package:soni_news_project/services/dio_helper/dio_helper_impl.dart';
import 'package:soni_news_project/services/errors/app_errors.dart';
import 'package:soni_news_project/utils/error_snackbar.dart';

class HeadlinesController extends GetxController {
  static HeadlinesController instance = Get.find();
  DioHelper _helper = DioHelperImpl();
  RxList<Article> articles = <Article>[].obs;
  RxInt index = 0.obs;
  RxBool isLoading = false.obs;

  @override
  void onReady() async {
    await getArticles();
    super.onReady();
  }

  Future getArticles() async {
    String _category = categories[index.value];
    isLoading.value = true;
    Either<AppError, List<Article>> _articlesEither =
        await _helper.getHeadlines(_category);
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
