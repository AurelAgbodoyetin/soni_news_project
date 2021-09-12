import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:soni_news_project/screens/all_tabs/all_tabs.dart';
import 'package:soni_news_project/services/errors/app_errors.dart';
import 'package:soni_news_project/services/prefs_helper/prefs_helper.dart';
import 'package:soni_news_project/services/prefs_helper/prefs_helper_impl.dart';
import 'package:soni_news_project/utils/error_snackbar.dart';

class OnboardingController extends GetxController {
  static OnboardingController instance = Get.find();
  SharedPrefsHelper _prefs = SharedPrefsHelperImpl();

  RxBool isSeen = false.obs;

  @override
  void onReady() async {
    await getIsSeen();
    super.onReady();
  }

  Future getIsSeen() async {
    Either<AppError, bool> _seenEither = await _prefs.getIsSeen();
    _seenEither.fold(
      (error) {
        return showErrorSnackbar(error);
      },
      (seen) => isSeen.value = seen,
    );
  }

  Future updateIsSeen() async {
    Either<AppError, Unit> _updateEither = await _prefs.updateIsSeen();
    _updateEither.fold(
      (error) {
        return showErrorSnackbar(error);
      },
      (_) => Get.to(() => AllTabs()),
    );
  }
}
