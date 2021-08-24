import 'package:flutter/material.dart';
import 'package:soni_news_project/models/article.dart';
import 'package:soni_news_project/utils/colors.dart';
import 'package:soni_news_project/utils/extensions.dart';

class DetailsHeader extends StatelessWidget {
  final Article article;
  DetailsHeader({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      margin: EdgeInsets.only(bottom: 10.0),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  article.title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  style: Theme.of(context).textTheme.headline2!.copyWith(
                        color: kLightenBackgroundColor,
                        fontSize: 20.0,
                      ),
                ),
                SizedBox(height: 7.0),
                Text(
                  article.publishedAt.toFormattedString(),
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.right,
                  maxLines: 1,
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: CircleAvatar(
              backgroundImage: AssetImage("assets/images/default_cover.png"),
              backgroundColor: kBackgroundColor,
              radius: 25.0,
            ),
          ),
        ],
      ),
    );
  }
}
