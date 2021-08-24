import 'package:soni_news_project/services/core/api.dart';
import 'package:soni_news_project/services/core/get_random_element.dart';

void runTests() {
  print(
    makeEverythingUrl(
      q: "Samsung",
      sortBy: getRandomElement(sorts),
      lang: getRandomElement(languages),
    ),
  );
  print(
    makeCategoryHeadlinesUrl(
      category: getRandomElement(categories),
      sortBy: getRandomElement(sorts),
      lang: getRandomElement(languages),
    ),
  );
  print(makeTrendingUrl(lang: getRandomElement(languages)));
  print(makeSearchUrl(q: "Bitcoin", lang: getRandomElement(languages)));
}
