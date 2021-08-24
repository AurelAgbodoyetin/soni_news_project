import 'package:flutter/material.dart';
import 'package:soni_news_project/screens/home_tab/home_tab.dart';
import 'package:soni_news_project/screens/offline_articles_tab/offline_articles_tab.dart';
import 'package:soni_news_project/screens/profile_tab/profile_tab.dart';
import 'package:soni_news_project/utils/colors.dart';

class AllTabs extends StatefulWidget {
  const AllTabs({Key? key}) : super(key: key);

  @override
  _AllTabsState createState() => _AllTabsState();
}

class _AllTabsState extends State<AllTabs> {
  int _selectedIndex = 0;
  List<Widget> tabs = [HomeTab(), OfflineArticlesTab(), ProfileTab()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: kBackgroundColor,
        selectedItemColor: kPrimaryColor,
        unselectedItemColor: kLightenBackgroundColor,
        currentIndex: _selectedIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: "Saved articles",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          )
        ],
        onTap: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
      ),
      body: SafeArea(
        child: tabs[_selectedIndex],
      ),
    );
  }
}
