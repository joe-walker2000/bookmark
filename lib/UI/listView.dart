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
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        _onTap() {
          setState(() {
            Navigator.of(context).pushNamed('/details',
                arguments: widget.receivedArticles[index]);
          });
        }

        return _buildTileTiltle(widget.receivedArticles, index, _onTap);
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
    elevation: 10,
    child: InkWell(
      onTap: _onTap,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 250,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 5,
                    style: titleStyle,
                    //softWrap: true,
                  ),
                  Text(
                    text,
                    overflow: TextOverflow.clip,
                    maxLines: 5,
                    style: descriptionStyle,
                    //softWrap: true,
                  ),
                ],
              ),
            ),
            Expanded(flex: 1, child: Image.network(imageUrl)),
          ],
        ),
      ),
    ),
  );
}
