import 'dart:collection';

import 'package:bookmark/data/blog.dart';
import 'package:flutter/cupertino.dart';

import 'api_call.dart';

class BookmarkManager extends ChangeNotifier {
  List<BookMark> _bookmarkList = [];
  bool isFetched = false;
  UnmodifiableListView<BookMark> get items =>
      UnmodifiableListView(_bookmarkList);
  // String jsonUrl =
  //     'https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=e1e0a9d049a0457dbc87e50f71794a43';

  List<BookMark> get list => _bookmarkList;
  void setter(List<BookMark> value) {
    _bookmarkList = value;
    notifyListeners();
  }
}
