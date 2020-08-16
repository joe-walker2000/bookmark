//import 'package:bookmark/route_generator.dart';
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
        title: Text(data.title.substring(0, 30)),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            ListTile(
              title: Text(data.title),
              trailing: Image.network(data.imageUrl),
              subtitle: Text(data.content),
            )
          ],
        ),
      ),
    );
  }
}
