import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:soni_news_project/controllers/core/controllers_instances.dart';
import 'package:soni_news_project/screens/home_tab/widget/headlines/articles_widget.dart';
import 'package:soni_news_project/services/core/api.dart';
import 'package:soni_news_project/utils/centered_cpi.dart';
import 'package:soni_news_project/utils/colors.dart';

class CategoriesAndArticlesWidget extends StatelessWidget {
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
                child: Obx(() {
                  return Container(
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
                          color: index == headlinesController.index.value
                              ? kPrimaryColor
                              : Colors.transparent,
                          width: 2.0,
                        ),
                      ),
                    ),
                  );
                }),
                onTap: () {
                  headlinesController.index.value = index;
                  headlinesController.getArticles();
                },
              );
            },
          ),
        ),
        SizedBox(height: 15.0),
        Expanded(
          child: Obx(() {
            if (headlinesController.isLoading.value) {
              return CenteredCircularProgressIndicator();
            } else {
              return ArticlesWidget(
                articles: headlinesController.articles.value,
              );
            }
          }),
        ),
      ],
    );
  }
}
