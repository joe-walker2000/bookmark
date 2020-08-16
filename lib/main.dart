import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:bookmark/entites/blog.dart';
import 'package:http/http.dart' as http;
import 'package:bookmark/route_generator.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
        'https://newsapi.org/v2/top-headlines?country=us&apiKey=e1e0a9d049a0457dbc87e50f71794a43';
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
      appBar: AppBar(
        title: Text('live Articles'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(
                _articles[index].title,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                _articles[index].text,
                style: TextStyle(color: Colors.grey[600]),
              ),
              trailing: Image.network(
                _articles[index].imageUrl,
                fit: BoxFit.fill,
              ),
              dense: true,
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
      ),
    );
  }
}
