import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soni_news_project/controllers/core/controllers_instances.dart';
import 'package:soni_news_project/screens/offline_articles_tab/offline_articles.dart';
import 'package:soni_news_project/utils/centered_cpi.dart';

class OfflineArticlesTab extends StatelessWidget {
  const OfflineArticlesTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (articleController.isLoading.value) {
        return CenteredCircularProgressIndicator();
      } else {
        return OfflineArticles(
          artList: articleController.offlineArticles.value,
        );
      }
    });
  }
}
