import 'package:flutter/material.dart';
import 'package:soni_news_project/utils/colors.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Here we go"),
          SizedBox(height: 10.0),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              cursorColor: kPrimaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
