import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:soni_news_project/controllers/core/controllers_instances.dart';
import 'package:soni_news_project/models/article.dart';
import 'package:soni_news_project/utils/colors.dart';
import 'package:soni_news_project/utils/extensions.dart';

class ArticleInfos extends StatelessWidget {
  final Article article;
  const ArticleInfos({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              article.title,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Text(
                    article.author,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: Theme.of(context).textTheme.headline3,
                  ),
                ),
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
                  child: IconButton(
                    onPressed: () {
                      //TODO Handle onPressed
                    },
                    icon: Icon(
                      Icons.share_outlined,
                      color: kPrimaryColor,
                      size: 25.0,
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              article.publishedAt.toFormattedString(),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
        ],
      ),
    );
  }
}
