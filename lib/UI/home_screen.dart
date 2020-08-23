import 'package:bookmark/UI/listView.dart';
import 'package:bookmark/UI/loading_screen.dart';
import 'package:bookmark/bloc/bookmark_bloc.dart';
import 'package:bookmark/data/blog.dart';
import 'package:flutter/material.dart';

@override
class HomeScreen extends StatelessWidget {
  final _bloc = BookMarkBloc();

  @override
  Widget build(BuildContext context) {
    _bloc.fetchData();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent[200],
        title: Text('BBC Articles'),
        centerTitle: true,
      ),
      body: Center(
        child: StreamBuilder(
          stream: _bloc.articles,
          initialData: [],
          builder:
              (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
            return _bloc.isLoaded ? ListBuilder(snapshot.data) : LoadingPage();
          },
        ),
      ),
    );
  }

  void dispose() {
    _bloc.dispose();
  }
}
