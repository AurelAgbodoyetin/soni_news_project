import 'package:flutter/material.dart';
import 'package:soni_news_project/screens/home_tab/widget/trending/header.dart';
import 'package:soni_news_project/screens/home_tab/widget/trending/trending_articles.dart';

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
          TrendingArticles(),
        ],
      ),
    );
  }
}
