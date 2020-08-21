import 'package:bookmark/UI/componants/loading_widget.dart';
import 'package:bookmark/UI/listView.dart';
import 'package:bookmark/data/bookmark_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<BookmarkManager>(context, listen: false).fetchdata();
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.blueAccent[200],
          title: Text('BBC Articles'),
          centerTitle: true,
        ),
        body:
            Consumer<BookmarkManager>(builder: (context, bookmarkList, child) {
          switch (bookmarkList.state) {
            case (Status.initial):
              return Text('Initial State');
            case (Status.loading):
              return loadingWedget;
            case (Status.loaded):
              return ListBuilder(bookmarkList.list);

            default:
              return Text('Default');
          }
        }));
  }
}
