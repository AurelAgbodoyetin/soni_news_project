import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soni_news_project/controllers/core/controllers_instances.dart';
import 'package:soni_news_project/models/article.dart';
import 'package:soni_news_project/utils/colors.dart';
import 'package:soni_news_project/utils/extensions.dart';

class TrendingArticlesInfos extends StatelessWidget {
  final Article article;
  TrendingArticlesInfos({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          flex: 2,
          child: Text(
            article.title,
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
            style: Theme.of(context).textTheme.headline2,
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
            children: [
              Obx(() {
                return Expanded(
                  child: IconButton(
                    onPressed: () {
                      articleController.saveArticle(article);
                    },
                    icon: Icon(
                      articleController.checkIfOffline(article)
                          ? Icons.bookmark
                          : Icons.bookmark_border_outlined,
                      color: kPrimaryColor,
                      size: 25.0,
                    ),
                  ),
                );
              }),
              Expanded(
                flex: 1,
                child: IconButton(
                  onPressed: () {
                    //TODO Handle onPressed
                  },
                  icon: Icon(
                    Icons.share_outlined,
                    color: kPrimaryColor,
                    size: 20.0,
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  article.publishedAt.toFormattedString(),
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.right,
                  maxLines: 1,
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
