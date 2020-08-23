import 'package:bookmark/data/blog.dart';
import 'package:flutter/material.dart';

import 'constans.dart';

class ListBuilder extends StatelessWidget {
  final List<dynamic> receivedArticles;
  ListBuilder(this.receivedArticles);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        _onTap() {
          Navigator.of(context)
              .pushNamed('/details', arguments: receivedArticles[index]);
        }

        return _buildTileTiltle(receivedArticles, index, _onTap);
      },
      itemCount: receivedArticles.length,
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
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 250,
              child: Padding(
                padding: const EdgeInsets.only(right: 2),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildTextWidgets(title, titleStyle),
                    _buildTextWidgets(text, descriptionStyle),
                  ],
                ),
              ),
            ),
            _buildImage(imageUrl),
          ],
        ),
      ),
    ),
  );
}

_buildTextWidgets(String text, TextStyle style) {
  return Text(
    text,
    style: style,
  );
}

_buildImage(String imageUrl) {
  return Expanded(
      flex: 1,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Image.network(imageUrl)));
}
