import 'dart:collection';

import 'package:bookmark/data/blog.dart';
import 'package:flutter/cupertino.dart';

import 'api_call.dart';

class BookmarkManager extends ChangeNotifier {
  List<BookMark> _bookmarkList = [];
  bool isFetched = false;
  String jsonUrl =
      'https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=e1e0a9d049a0457dbc87e50f71794a43';

  BookmarkManager() {
    CallApi.fetchArticles(jsonUrl).then((value) {
      _bookmarkList.addAll(value);
      isFetched = true;
      notifyListeners();
    });
  }

  List<BookMark> get list => _bookmarkList;
}
