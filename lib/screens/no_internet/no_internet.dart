import 'package:flutter/material.dart';
import 'package:soni_news_project/utils/colors.dart';

class NoInternetPage extends StatelessWidget {
  const NoInternetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/no_internet.png",
              height: 300,
              width: 300,
            ),
            Text(
              "No internet connection",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline1,
            ),
            SizedBox(height: 20.0),
            Text(
              "Please check your internet connection and try again",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontSize: 16.0,
                  ),
            ),
            SizedBox(height: 40.0),
            TextButton(
              onPressed: () {
                //TODO Handle onPressed
              },
              style: TextButton.styleFrom(
                backgroundColor: kLightenPrimaryColor,
                shape: StadiumBorder(),
                minimumSize: Size(200.0, 50.0),
              ),
              child: Text(
                "Try again",
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: 15.0,
                      color: kBackgroundColor,
                    ),
              ),
            ),
            SizedBox(height: 20.0),
            TextButton(
              onPressed: () {
                //TODO Handle onPressed
              },
              style: TextButton.styleFrom(
                backgroundColor: kLightenPrimaryColor,
                shape: StadiumBorder(),
                minimumSize: Size(200.0, 50.0),
              ),
              child: Text(
                "Offline articles",
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: 15.0,
                      color: kBackgroundColor,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
