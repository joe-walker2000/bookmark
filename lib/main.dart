import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:bookmark/entites/blog.dart';
import 'package:http/http.dart' as http;
import 'package:bookmark/route_generator.dart';
import 'package:bookmark/constans.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //showSemanticsDebugger: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<BookMark> _articles = List<BookMark>();

  Future<List<BookMark>> fetchNotes() async {
    var url =
        'https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=e1e0a9d049a0457dbc87e50f71794a43';
    print('fetching');
    var response = await http.get(url);
    print('finished');
    var _articles = List<BookMark>();

    if (response.statusCode == 200) {
      print('s');
      Map<String, dynamic> map = json.decode(response.body);
      var jsonArticles = map['articles'];
      for (var articles in jsonArticles) {
        if (articles['description'] == null ||
            articles['urlToImage'] == null ||
            articles['content'] == null) {
          print('isnull');
          continue;
        } else {
          print('success');
          _articles.add(BookMark.fromJson(articles));
        }
      }
    } else {
      print('faild');
    }
    return _articles;
  }

  @override
  void initState() {
    fetchNotes().then((value) {
      setState(() {
        _articles.addAll(value);
      });
    });
    super.initState();
  }

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
        return Card(
          color: Colors.white,
          elevation: 20.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: ListTile(
            contentPadding: EdgeInsets.fromLTRB(8, 2, 8, 8),
            title: Text(
              _articles[index].title,
              style: titleStyle,
            ),
            subtitle: Text(
              _articles[index].text,
              style: descriptionStyle,
            ),
            trailing: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.network(
                _articles[index].imageUrl,
                //fit: BoxFit.fill,
                height: 150.0,
                width: 100.0,
              ),
            ),
            //dense: true,
            onTap: () {
              setState(() {
                print('hello world??');
                Navigator.of(context)
                    .pushNamed('/details', arguments: _articles[index]);
              });
            },
          ),
        );
      },
      itemCount: _articles.length,
    );
  }
}
