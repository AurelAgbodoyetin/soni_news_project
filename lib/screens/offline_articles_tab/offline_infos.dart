import 'package:flutter/material.dart';
import 'package:soni_news_project/models/article.dart';
import 'package:soni_news_project/utils/colors.dart';
import 'package:soni_news_project/utils/extensions.dart';

class OfflineArticlesInfos extends StatelessWidget {
  final Article article;
  OfflineArticlesInfos({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            flex: 3,
            child: Text(
              article.title,
              overflow: TextOverflow.ellipsis,
              maxLines: 4,
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: IconButton(
                      onPressed: () {
                        //TODO Handle onPressed
                      },
                      icon: Icon(
                        Icons.upload_outlined,
                        color: kPrimaryColor,
                        size: 20.0,
                      ),
                    ),
                  ),
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
                    flex: 4,
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
          ),
        ],
      ),
    );
  }
}
