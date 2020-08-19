import 'package:bookmark/UI/listView.dart';
import 'package:bookmark/data/bookmarkList.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
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
            return ListBuilder(bookmarkList.list);
          })),
    );
  }
}
