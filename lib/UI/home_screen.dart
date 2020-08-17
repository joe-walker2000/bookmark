import 'package:bookmark/data/blog.dart';
import 'package:flutter/material.dart';
import 'constans.dart';

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
        body: listView());
  }

  Widget listView() {
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
