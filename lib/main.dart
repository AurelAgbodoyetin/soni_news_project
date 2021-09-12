import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soni_news_project/controllers/core/controllers_instances.dart';
import 'package:soni_news_project/controllers/core/put_controllers.dart';
import 'package:soni_news_project/screens/all_tabs/all_tabs.dart';
import 'package:soni_news_project/screens/onboarding/onboarding.dart';
import 'package:soni_news_project/utils/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initControllers();
  runApp(SoniNewsApp());
}

class SoniNewsApp extends StatelessWidget {
  const SoniNewsApp({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Soni News App',
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: Obx(
        () {
          if (onboardingController.isSeen.value) {
            return AllTabs();
          } else {
            return OnboardingPage();
          }
        },
      ),
    );
  }
}
