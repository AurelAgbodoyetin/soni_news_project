import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:soni_news_project/services/errors/app_errors.dart';
import 'package:soni_news_project/services/prefs_helper/prefs_helper.dart';
import 'package:soni_news_project/services/prefs_helper/prefs_helper_impl.dart';
import 'package:soni_news_project/utils/error_snackbar.dart';

class ProfileController extends GetxController {
  static ProfileController instance = Get.find();
  RxInt nReadArticles = 0.obs;
  RxInt nOnlineArticles = 0.obs;
  RxInt nOfflineArticles = 0.obs;
  RxBool isLoading = false.obs;
  SharedPrefsHelper _helper = SharedPrefsHelperImpl();

  @override
  void onReady() async {
    await getStats();
    super.onReady();
  }

  Future getStats() async {
    isLoading.value = true;
    Either<AppError, int> _offlineEither = await _helper.getNOfflineArticles();
    Either<AppError, int> _onlineEither = await _helper.getNOnlineArticles();
    Either<AppError, int> _readEither = await _helper.getNReadArticles();
    isLoading.value = false;
    _offlineEither.fold(
      (error) {
        return showErrorSnackbar(error);
      },
      (off) {
        nOfflineArticles.value = off;
      },
    );
    _onlineEither.fold(
      (error) {
        return showErrorSnackbar(error);
      },
      (onl) {
        nOnlineArticles.value = onl;
      },
    );
    _readEither.fold(
      (error) {
        return showErrorSnackbar(error);
      },
      (read) {
        nReadArticles.value = read;
      },
    );
  }

  Future incrementOnline() async {
    Either<AppError, Unit> _either = await _helper.updateNOnlineArticles();
    _either.fold(
      (error) {
        return showErrorSnackbar(error);
      },
      (_) {
        getStats();
      },
    );
  }

  Future incrementOffline() async {
    Either<AppError, Unit> _either = await _helper.updateNOfflineArticles();
    _either.fold(
      (error) {
        return showErrorSnackbar(error);
      },
      (_) {
        getStats();
      },
    );
  }

  Future incrementRead() async {
    Either<AppError, Unit> _either = await _helper.updateNReadArticles();
    _either.fold(
      (error) {
        return showErrorSnackbar(error);
      },
      (_) {
        getStats();
      },
    );
  }
}
