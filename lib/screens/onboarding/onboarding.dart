import 'dart:math';
import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Transform.rotate(
              angle: pi / 4,
              child: Image.asset("assets/images/logo.png"),
            ),
            Text(
              "Welcome to",
              style: Theme.of(context).textTheme.headline1,
            ),
            SizedBox(height: 10.0),
            Text(
              "Soni News",
              style: Theme.of(context).textTheme.headline1!.copyWith(
                    fontSize: 40,
                    letterSpacing: 1.5,
                  ),
            ),
            SizedBox(height: 15.0),
            Text(
              "The application that offers news tailored for you. Tell us what you like to read, we'll take care of the rest.",
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontSize: 17.0,
                  ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20.0),
            TextButton(
              onPressed: () {
                //TODO Handle onPressed
              },
              child: Text(
                "Get Started",
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: 15.0,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
