import 'package:bookmark/UI/loading_screen.dart';
import 'package:bookmark/data/blog.dart';
import 'package:flutter/material.dart';
import 'package:bookmark/data/route_generator.dart';
import 'package:provider/provider.dart';
import 'package:bookmark/data/bookmarkList.dart';
import 'UI/home_screen.dart';
import 'data/api_call.dart';

void main() => runApp(App());

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  bool isLoaded = false;
  List<BookMark> _articles = List<BookMark>();
  String jsonUrl =
      'https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=e1e0a9d049a0457dbc87e50f71794a43';

  @override
  void initState() {
    CallApi.fetchArticles(jsonUrl).then((value) {
      print('fetch f');
      _articles.addAll(value);
      print('list added');
      isLoaded = true;
      final providerList = Provider.of<BookmarkManager>(context);
      providerList.setter(_articles);
      // setState(() {
      //   _articles.addAll(value);
      //   isLoaded = true;
      // });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Provider<BookmarkManager>(
      create: (context) => BookmarkManager(),
      child: MaterialApp(
        title: 'Bookmark',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: isLoaded ? HomeScreen() : LoadingPage(),
        // home: isLoaded ? HomeScreen() : LoadingPage(),
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
