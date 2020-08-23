import 'blog.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BookmarksFetching {
  static String jsonUrl =
      'https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=e1e0a9d049a0457dbc87e50f71794a43';
  static Future<List<BookMark>> fetchArticles() async {
    var response = await http.get(jsonUrl);
    var _articles = List<BookMark>();

    if (response.statusCode == 200) {
      Map<String, dynamic> map = json.decode(response.body);
      var jsonArticles = map['articles'];
      for (var articles in jsonArticles) {
        if (articles['description'] == null ||
            articles['urlToImage'] == null ||
            articles['content'] == null) {
          continue;
        } else {
          _articles.add(BookMark.fromJson(articles));
        }
      }
    }
    return _articles;
  }
}
