import 'package:flutter/material.dart';
import 'package:soni_news_project/models/article.dart';
import 'package:soni_news_project/screens/details/widgets/appbar.dart';
import 'package:soni_news_project/screens/details/widgets/article_content.dart';
import 'package:soni_news_project/screens/details/widgets/cover_image.dart';
import 'package:soni_news_project/screens/details/widgets/header.dart';

class DetailsPage extends StatelessWidget {
  final Article article;
  DetailsPage({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              DetailsAppBar(),
              DetailsHeader(article: article),
              CoverImage(article: article),
              ArticleContent(article: article),
            ],
          ),
        ),
      ),
    );
  }
}
