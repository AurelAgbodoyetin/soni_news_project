import 'package:flutter/material.dart';
import 'package:soni_news_project/data/articles.dart';
import 'package:soni_news_project/screens/home_tab/widget/trending/trending_article_card.dart';

class TrendingArticles extends StatelessWidget {
  const TrendingArticles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130.0,
      child: ListView.builder(
        itemCount: artList.length,
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return TrendingArticleCard(article: artList[index]);
        },
      ),
    );
  }
}
