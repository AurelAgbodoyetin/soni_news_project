import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:soni_news_project/controllers/core/controllers_instances.dart';
import 'package:soni_news_project/models/article.dart';
import 'package:soni_news_project/services/errors/app_errors.dart';
import 'package:soni_news_project/services/sqflite_helper/core/sqflite_helper.dart';
import 'package:soni_news_project/services/sqflite_helper/sqflite_helper_impl.dart';
import 'package:soni_news_project/utils/error_snackbar.dart';
import 'package:soni_news_project/utils/success_snackbar.dart';

class ArticleController extends GetxController {
  static ArticleController instance = Get.find();

  RxBool isLoading = false.obs;
  SqfLiteHelper _helper = SqfLiteHelperImpl();
  RxList<Article> offlineArticles = <Article>[].obs;

  @override
  void onReady() async {
    await getOfflineArticles();
    super.onReady();
  }

  Future getOfflineArticles() async {
    isLoading.value = true;
    Either<AppError, List<Article>?> _articlesEither =
        await _helper.getAllArticle();
    isLoading.value = false;
    _articlesEither.fold(
      (error) {
        return showErrorSnackbar(error);
      },
      (gotArticles) {
        if (gotArticles != null) {
          offlineArticles.value = gotArticles;
        }
      },
    );
  }

  bool checkIfOffline(Article article) {
    List<Article>? _res =
        offlineArticles.where((art) => art.title == article.title).toList();
    return _res.length != 0;
  }

  Future saveArticle(Article article) async {
    isLoading.value = true;
    Either<AppError, Article> _articlesEither = await _helper.insert(
      article,
    );
    isLoading.value = false;
    _articlesEither.fold(
      (error) {
        return showErrorSnackbar(error);
      },
      (_) {
        showSuccessSnackbar("Article ajouté hors ligne");
        getOfflineArticles();
        headlinesController.getArticles();
        trendingController.getArticles();
        profileController.incrementOffline();
      },
    );
  }

  Future removeArticle(Article article) async {
    isLoading.value = true;
    Either<AppError, int?> _articlesEither = await _helper.delete(article.id!);
    isLoading.value = false;
    _articlesEither.fold(
      (error) {
        return showErrorSnackbar(error);
      },
      (_) {
        showSuccessSnackbar("Article supprimé des hors lignes");
      },
    );
  }
}
