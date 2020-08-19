import 'package:bookmark/UI/listView.dart';
import 'package:bookmark/data/blog.dart';
import 'package:bookmark/data/bookmarkList.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  // final List<BookMark> receivedArticles;

  // HomeScreen(this.receivedArticles);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BookmarkManager(),
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.blueAccent[200],
            title: Text('BBC Articles'),
            centerTitle: true,
          ),
          body: Consumer<BookmarkManager>(
              builder: (context, bookmarkList, child) {
            //bookmarkList.addAll();
            return ListBuilder(bookmarkList.list);
          })),
    );
  }
}
