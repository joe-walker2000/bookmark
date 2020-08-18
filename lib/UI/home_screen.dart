import 'package:bookmark/UI/listView.dart';
import 'package:bookmark/data/blog.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final List<BookMark> receivedArticles;

  HomeScreen(this.receivedArticles);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.blueAccent[200],
          title: Text('BBC Articles'),
          centerTitle: true,
        ),
        body: ListBuilder(widget.receivedArticles));
  }
}
