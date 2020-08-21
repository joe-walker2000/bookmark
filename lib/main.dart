import 'package:bookmark/UI/componants/loading_widget.dart';
import 'package:bookmark/data/bookmark.dart';
import 'package:flutter/material.dart';
import 'package:bookmark/data/route_generator.dart';
import 'package:provider/provider.dart';
import 'package:bookmark/data/bookmark_manager.dart';
import 'UI/home_screen.dart';
import 'data/api_call.dart';

void main() => runApp(App());

class App extends StatelessWidget {
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
        home: HomeScreen(),

        // home: isLoaded ? HomeScreen() : LoadingPage(),
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
