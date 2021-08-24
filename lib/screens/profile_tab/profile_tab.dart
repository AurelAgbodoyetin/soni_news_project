import 'package:flutter/material.dart';
import 'package:soni_news_project/screens/profile_tab/widgets/stat_card.dart';
import 'package:soni_news_project/utils/colors.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StatCard(label: "Read aricles", count: 10),
          StatCard(label: "Saved offline articles", count: 8),
          StatCard(label: "Saved online articles", count: 5),
          SizedBox(height: 15.0),
          TextButton(
            onPressed: () {
              //TODO Handle onPressed
            },
            style: TextButton.styleFrom(
              backgroundColor: kLightenPrimaryColor,
            ),
            child: Text(
              "Sign in",
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontSize: 15.0,
                    color: kBackgroundColor,
                  ),
            ),
          ),
          SizedBox(height: 15.0),
          TextButton(
            onPressed: () {
              //TODO Handle onPressed
            },
            style: TextButton.styleFrom(
              backgroundColor: kLightenPrimaryColor,
            ),
            child: Text(
              "Sign out",
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontSize: 15.0,
                    color: kBackgroundColor,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
