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
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BookmarkManager>(
      create: (context) => BookmarkManager(),
      child: MaterialApp(
        title: 'Bookmark',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Consumer<BookmarkManager>(builder: (context, bookmark, child) {
          return bookmark.isFetched ? HomeScreen() : LoadingPage();
        }),
        // home: isLoaded ? HomeScreen() : LoadingPage(),
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
