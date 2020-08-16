//import 'package:bookmark/route_generator.dart';
import 'package:bookmark/constans.dart';
import 'package:flutter/material.dart';
//import 'package:bookmark/main.dart';
import 'package:bookmark/entites/blog.dart';

class DetailsPage extends StatelessWidget {
  final BookMark data;

  // In the constructor, require a Todo.
  DetailsPage({Key key, @required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(data.title),
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
