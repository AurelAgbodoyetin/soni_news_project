import 'package:flutter/material.dart';
import 'package:soni_news_project/utils/colors.dart';

class TrendingHeader extends StatelessWidget {
  const TrendingHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "Trending",
      style: Theme.of(context).textTheme.headline2!.copyWith(
            letterSpacing: 1.0,
            color: kLightenBackgroundColor,
            fontSize: 25.0,
          ),
    );
  }
}
