import 'package:flutter/material.dart';
import 'package:soni_news_project/utils/colors.dart';

class StatCard extends StatelessWidget {
  final String label;
  final int count;
  StatCard({
    Key? key,
    required this.label,
    required this.count,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      width: double.infinity,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: kLightenBackgroundColor,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          children: [
            Expanded(
              flex: 4,
              child: Text(
                label,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.headline2!.copyWith(
                      fontSize: 20.0,
                    ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                count.toString(),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.headline2!.copyWith(
                      fontSize: 40.0,
                      color: kPrimaryColor,
                    ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
