import 'package:get/get.dart';
import 'package:soni_news_project/controllers/article_controller.dart';
import 'package:soni_news_project/controllers/headlines_controller.dart';
import 'package:soni_news_project/controllers/onboarding_controller.dart';
import 'package:soni_news_project/controllers/profile_controller.dart';
import 'package:soni_news_project/controllers/search_controller.dart';
import 'package:soni_news_project/controllers/trending_controller.dart';

initControllers() {
  Get.put(OnboardingController());
  Get.put(HeadlinesController());
  Get.put(TrendingController());
  Get.put(ProfileController());
  Get.put(SearchController());
  Get.put(ArticleController());
}
