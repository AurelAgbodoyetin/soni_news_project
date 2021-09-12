class Article {
  Article({
    //required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.isOffline,
    required this.isOnline,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
    this.id,
  });

  final String author;
  final String title;
  int? id;
  bool isOffline, isOnline;
  final String description;
  final String url;
  final String urlToImage;
  final DateTime publishedAt;
  final String content;

  factory Article.fromMap(Map<String, dynamic> json) => Article(
        author: json["author"] ?? "Missing author",
        title: json["title"] ?? "Missing title",
        description: json["description"] ?? "Missing description",
        url: json["url"] ?? "Missing url",
        urlToImage: json["urlToImage"] ?? "Missing url",
        publishedAt: DateTime.parse(json["publishedAt"]),
        content: json["content"] ?? "Missing content",
        isOffline: false,
        isOnline: false,
      );
  factory Article.fromSqfMap(Map<String, dynamic> json) => Article(
        id: json["id"],
        author: json["author"],
        title: json["title"],
        description: json["description"],
        url: json["url"],
        urlToImage: json["urlToImage"],
        publishedAt: DateTime.parse(json["publishedAt"]),
        content: json["content"],
        isOffline: json["isOffline"] == 1,
        isOnline: json["isOnline"] == 1,
      );

  Map<String, dynamic> toMap() => {
        "author": author,
        "title": title,
        "description": description,
        "url": url,
        "urlToImage": urlToImage,
        "publishedAt": publishedAt.toIso8601String(),
        "content": content,
        "isOnline": isOnline ? 1 : 0,
        "isOffline": isOffline ? 1 : 0,
      };
}
