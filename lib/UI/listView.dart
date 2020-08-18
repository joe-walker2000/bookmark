import 'package:bookmark/data/blog.dart';
import 'package:flutter/material.dart';

import 'constans.dart';

class ListBuilder extends StatefulWidget {
  final List<BookMark> receivedArticles;

  ListBuilder(this.receivedArticles);
  @override
  _ListBuilderState createState() => _ListBuilderState();
}

class _ListBuilderState extends State<ListBuilder> {
  _onTap(int index) {
    setState(() {
      Navigator.of(context)
          .pushNamed('/details', arguments: widget.receivedArticles[index]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return _buildTileTiltle(widget.receivedArticles, index, _onTap(index));
      },
      itemCount: widget.receivedArticles.length,
    );
  }
}

_buildTileTiltle(List<BookMark> articles, int index, Function _onTap) {
  String title = articles[index].title;
  String text = articles[index].text;
  String imageUrl = articles[index].imageUrl;
  return Card(
    color: Colors.white,
    elevation: 20.0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    child: ListTile(
      contentPadding: EdgeInsets.fromLTRB(8, 2, 8, 8),
      title: Text(
        title,
        style: titleStyle,
      ),
      subtitle: Text(
        text,
        style: descriptionStyle,
      ),
      trailing: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Image.network(
          imageUrl,
          height: 150.0,
          width: 100.0,
        ),
      ),
      onTap: _onTap,
    ),
  );
}
