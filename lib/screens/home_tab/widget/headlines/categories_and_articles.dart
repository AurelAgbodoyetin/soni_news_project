import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:soni_news_project/screens/home_tab/widget/headlines/articles_widget.dart';
import 'package:soni_news_project/services/core/api.dart';
import 'package:soni_news_project/utils/colors.dart';

class CategoriesAndArticlesWidget extends StatefulWidget {
  const CategoriesAndArticlesWidget({Key? key}) : super(key: key);

  @override
  _CategoriesAndArticlesWidgetState createState() =>
      _CategoriesAndArticlesWidgetState();
}

class _CategoriesAndArticlesWidgetState
    extends State<CategoriesAndArticlesWidget> {
  int _selectedCategory = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20.0),
          height: 60.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.0),
          ),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.0,
                  ),
                  child: Text(
                    categories[index].toUpperCase(),
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          letterSpacing: 1.0,
                          fontSize: 15.0,
                        ),
                  ),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: index == _selectedCategory
                            ? kPrimaryColor
                            : Colors.transparent,
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  setState(() {
                    _selectedCategory = index;
                  });
                },
              );
            },
          ),
        ),
        SizedBox(height: 15.0),
        Expanded(
          child: ArticlesWidget(category: _selectedCategory),
        ),
      ],
    );
  }
}
