import 'dart:async';
import 'package:bookmark/data/api_call.dart';
import 'package:bookmark/data/blog.dart';

class BookMarkBloc {
  List<BookMark> _articles = List<BookMark>();
  bool isLoaded = false;
  final _bookmarkStateController = StreamController<List<BookMark>>();
  StreamSink<List<BookMark>> get _listArticles => _bookmarkStateController.sink;
  Stream<List<BookMark>> get articles => _bookmarkStateController.stream;

  void fetchData() async {
    isLoaded = false;

    await BookmarksFetching.fetchArticles().then((value) {
      _articles.addAll(value);
      isLoaded = true;
    });
    _listArticles.add(_articles);
  }

  void dispose() {
    _bookmarkStateController.close();
  }
}
