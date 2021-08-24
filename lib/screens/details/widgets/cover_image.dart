import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:soni_news_project/models/article.dart';
import 'package:soni_news_project/utils/colors.dart';

class CoverImage extends StatelessWidget {
  final Article article;
  CoverImage({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.0,
      margin: EdgeInsets.only(bottom: 20.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: CachedNetworkImage(
          imageUrl: article.urlToImage,
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.fill,
          progressIndicatorBuilder: (context, url, downloadProgress) {
            return Center(
              child: SizedBox(
                height: 40.0,
                width: 40.0,
                child: CircularProgressIndicator(
                  value: downloadProgress.progress,
                  color: kLightenPrimaryColor,
                ),
              ),
            );
          },
          errorWidget: (context, url, error) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.error,
                  color: Colors.red,
                  size: 20.0,
                ),
                SizedBox(height: 15.0),
                Text(
                  "Unable to download cover image",
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .headline2!
                      .copyWith(color: kLightenPrimaryColor),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
