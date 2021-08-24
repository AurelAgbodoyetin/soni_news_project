import 'package:flutter/material.dart';
import 'package:soni_news_project/models/article.dart';
import 'package:soni_news_project/screens/details/details.dart';
import 'package:soni_news_project/screens/home_tab/widget/trending/trending_article_image.dart';
import 'package:soni_news_project/screens/home_tab/widget/trending/trending_infos.dart';
import 'package:soni_news_project/utils/colors.dart';

class TrendingArticleCard extends StatelessWidget {
  final Article article;
  TrendingArticleCard({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => DetailsPage(article: article),
        ));
      },
      child: Container(
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
              flex: 1,
              child: TrendingArticleImage(article: article),
            ),
            SizedBox(width: 10.0),
            Expanded(
              flex: 2,
              child: TrendingArticlesInfos(article: article),
            ),
          ],
        ),
      ),
    );
  }
}
