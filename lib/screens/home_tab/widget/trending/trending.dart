import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soni_news_project/controllers/core/controllers_instances.dart';
import 'package:soni_news_project/screens/home_tab/widget/trending/header.dart';
import 'package:soni_news_project/screens/home_tab/widget/trending/trending_articles.dart';
import 'package:soni_news_project/utils/centered_cpi.dart';

class Trending extends StatelessWidget {
  const Trending({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TrendingHeader(),
          Expanded(
            child: Obx(() {
              if (trendingController.isLoading.value) {
                return CenteredCircularProgressIndicator();
              } else {
                return TrendingArticles(
                  artList: trendingController.articles.value,
                );
              }
            }),
          ),
          // TrendingArticles(),
        ],
      ),
    );
  }
}
