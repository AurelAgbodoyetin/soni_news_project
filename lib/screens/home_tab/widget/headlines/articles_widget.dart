import 'package:flutter/material.dart';
import 'package:soni_news_project/data/articles.dart';
import 'package:soni_news_project/screens/home_tab/widget/headlines/article_card.dart';

class ArticlesWidget extends StatelessWidget {
  final int category;
  ArticlesWidget({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListView.builder(
        itemCount: artList.length,
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return ArticleCard(article: artList[index]);
        },
      ),
    );
  }
}
