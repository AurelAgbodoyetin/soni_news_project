import 'package:flutter/material.dart';
import 'package:soni_news_project/models/article.dart';
import 'package:soni_news_project/screens/home_tab/widget/trending/trending_article_image.dart';
import 'package:soni_news_project/screens/offline_articles_tab/offline_infos.dart';
import 'package:soni_news_project/utils/colors.dart';

class OfflineArticleCard extends StatelessWidget {
  final Article article;
  OfflineArticleCard({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.0,
      width: MediaQuery.of(context).size.width * 0.8,
      margin: EdgeInsets.all(15.0),
      padding: EdgeInsets.only(right: 7.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: kLightenBackgroundColor,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: TrendingArticleImage(article: article),
          ),
          SizedBox(width: 10.0),
          Expanded(
            flex: 3,
            child: OfflineArticlesInfos(article: article),
          ),
        ],
      ),
    );
  }
}
