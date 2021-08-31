import 'package:intl/intl.dart';
import 'package:soni_news_project/services/core/api_key.dart';
import 'package:soni_news_project/services/core/get_random_element.dart';

//const String kApiKey = <api key>;
const String kBaseUrl = "https://newsapi.org/v2";

final List<String> languages = ["en", "fr", "es"];
final List<String> countries = ["us", "fr", "jp", "ch", "ng", "ru"];
final List<String> sorts = ["relevancy", "popularity", "publishedAt"];
final List<String> categories = [
  "business",
  "entertainment",
  "general",
  "health",
  "science",
  "sports",
  "technology",
];

String makeEverythingUrl({
  required String q,
  String sortBy = "relevancy",
  String lang = "en",
}) {
  assert(sorts.contains(sortBy));
  assert(languages.contains(lang));
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  String yesterday = formatter.format(
    DateTime.now().subtract(Duration(days: 1)),
  );
  String today = formatter.format(DateTime.now());
  return "$kBaseUrl/everything?q=$q&from=$yesterday&to=$today&sortBy=$sortBy&language=$lang&apiKey=$kApiKey";
}

String makeCategoryHeadlinesUrl({
  required String category,
  String sortBy = "relevancy",
  String lang = "en",
}) {
  assert(categories.contains(category));
  assert(sorts.contains(sortBy));
  assert(languages.contains(lang));
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  String yesterday =
      formatter.format(DateTime.now().subtract(Duration(days: 1)));
  String today = formatter.format(DateTime.now());
  return "$kBaseUrl/top-headlines?category=$category&from=$yesterday&to=$today&sortBy=$sortBy&language=$lang&apiKey=$kApiKey";
}

String makeTrendingUrl({String lang = "en"}) {
  assert(languages.contains(lang));
  String country = getRandomElement(countries);
  String sortBy = getRandomElement(sorts);

  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  String yesterday =
      formatter.format(DateTime.now().subtract(Duration(days: 3)));
  String today = formatter.format(DateTime.now());
  return "$kBaseUrl/top-headlines?country=$country&from=$yesterday&to=$today&sortBy=$sortBy&language=$lang&apiKey=$kApiKey";
}

String makeSearchUrl({required String q, String lang = "en"}) {
  String sortBy = "relevancy";

  assert(sorts.contains(sortBy));
  assert(languages.contains(lang));
  return "$kBaseUrl/everything?q=$q&sortBy=$sortBy&language=$lang&apiKey=$kApiKey";
}
