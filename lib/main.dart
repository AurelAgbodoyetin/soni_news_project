import 'package:flutter/material.dart';
import 'package:soni_news_project/screens/all_tabs/all_tabs.dart';
import 'package:soni_news_project/services/dio_helper/dio_helper.dart';
import 'package:soni_news_project/services/dio_helper/dio_helper_impl.dart';
import 'package:soni_news_project/utils/theme.dart';

void main() async {
  DioHelper d = DioHelperImpl();
  var a = await d.getTrending("en"); //("general", "relevancy", "en");
  print(a);
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
