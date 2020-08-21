//import 'package:bookmark/route_generator.dart';
import 'package:bookmark/UI/styles.dart';
import 'package:flutter/material.dart';
//import 'package:bookmark/main.dart';
import 'package:bookmark/data/bookmark.dart';

class DetailsScreen extends StatelessWidget {
  final BookMark data;

  // In the constructor, require a Todo.
  DetailsScreen({Key key, @required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('BBC News'),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Image.network(data.imageUrl),
            SizedBox(height: 10),
            Text(data.title, style: titleStyle),
            SizedBox(height: 10),
            Text(data.content),
          ],
        ),
      ),
    );
  }
}
