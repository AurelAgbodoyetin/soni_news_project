import 'package:flutter/material.dart';
import 'package:soni_news_project/models/article.dart';
import 'package:soni_news_project/utils/colors.dart';

class ArticleContent extends StatelessWidget {
  final Article article;
  ArticleContent({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: Text(
            article.content,
            overflow: TextOverflow.ellipsis,
            maxLines: 10,
            //textAlign: TextAlign.justify,
            style: Theme.of(context).textTheme.headline1!.copyWith(
                  color: kLightenBackgroundColor,
                  fontSize: 16.0,
                ),
          ),
        ),
        Container(
          height: 50.0,
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: TextButton(
                  onPressed: () {
                    //TODO Handle onPressed
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: kLightenPrimaryColor,
                  ),
                  child: Text(
                    "Check it over the web",
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 15.0,
                          color: kBackgroundColor,
                        ),
                  ),
                ),
              ),
              Expanded(
                child: IconButton(
                  onPressed: () {
                    //TODO Handle onPressed
                  },
                  icon: Icon(
                    Icons.bookmark_border_outlined,
                    color: kPrimaryColor,
                    size: 30.0,
                  ),
                ),
              ),
              Expanded(
                child: IconButton(
                  onPressed: () {
                    //TODO Handle onPressed
                  },
                  icon: Icon(
                    Icons.share_outlined,
                    color: kPrimaryColor,
                    size: 30.0,
                  ),
                ),
              )
            ],
          ),
        )
      ],
    ));
  }
}
