import 'package:flutter/material.dart';
import 'package:soni_news_project/utils/colors.dart';

class DetailsAppBar extends StatelessWidget {
  const DetailsAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.0,
      margin: EdgeInsets.only(bottom: 15.0),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: kLightenBackgroundColor,
            ),
          )
        ],
      ),
    );
  }
}
