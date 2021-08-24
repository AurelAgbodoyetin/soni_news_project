import 'package:flutter/material.dart';
import 'package:soni_news_project/screens/all_tabs/all_tabs.dart';
import 'package:soni_news_project/utils/theme.dart';

void main() {
  //runTests();
  runApp(SoniNewsApp());
}

class SoniNewsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Soni News App',
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: AllTabs(),
    );
  }
}
