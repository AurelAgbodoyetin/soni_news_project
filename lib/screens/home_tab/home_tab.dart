import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soni_news_project/controllers/core/controllers_instances.dart';
import 'package:soni_news_project/screens/home_tab/widget/headlines/categories_and_articles.dart';
import 'package:soni_news_project/screens/home_tab/widget/search/search_field.dart';
import 'package:soni_news_project/screens/home_tab/widget/trending/trending.dart';
import 'package:soni_news_project/utils/centered_cpi.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (searchController.isLoading.value) {
        return CenteredCircularProgressIndicator();
      } else {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  SearchFieldWidget(),
                  Expanded(
                    child: CategoriesAndArticlesWidget(),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            Expanded(
              flex: 1,
              child: Center(child: Trending()),
            ),
          ],
        );
      }
    });
  }
}
