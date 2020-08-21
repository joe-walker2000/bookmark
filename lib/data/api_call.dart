import 'bookmark.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BookmarksFetching {
  static Future<List<BookMark>> fetchArticles(url) async {
    var response = await http.get(url);
    var _articles = List<BookMark>();

    //TODO: move null checking to the BookMark class;

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
