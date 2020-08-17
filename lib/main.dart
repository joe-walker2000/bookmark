import 'package:bookmark/UI/loading_screen.dart';
import 'package:bookmark/data/blog.dart';
import 'package:flutter/material.dart';
import 'package:bookmark/data/route_generator.dart';
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
      setState(() {
        _articles.addAll(value);
        isLoaded = true;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bookmark',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: isLoaded ? HomeScreen(_articles) : LoadingPage(),
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
