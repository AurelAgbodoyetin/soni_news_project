import 'package:flutter/material.dart';
import 'package:soni_news_project/data/articles.dart';
import 'package:soni_news_project/screens/offline_articles_tab/offline_article_card.dart';

class OfflineArticles extends StatelessWidget {
  const OfflineArticles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      child: ListView.builder(
        itemCount: artList.length,
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return OfflineArticleCard(article: artList[index]);
        },
      ),
    );
  }
}
