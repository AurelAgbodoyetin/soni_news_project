import 'package:flutter/material.dart';
import 'package:soni_news_project/models/article.dart';
import 'package:soni_news_project/screens/details/details.dart';
import 'package:soni_news_project/screens/home_tab/widget/headlines/article_image.dart';
import 'package:soni_news_project/screens/home_tab/widget/headlines/infos.dart';
import 'package:soni_news_project/utils/colors.dart';

class ArticleCard extends StatelessWidget {
  final Article article;
  ArticleCard({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => DetailsPage(article: article),
        ));
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Container(
                width: 250.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: kLightenBackgroundColor,
                ),
                child: Column(
                  children: [
                    Expanded(child: ArticleImage(article: article)),
                    Expanded(child: ArticleInfos(article: article)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
