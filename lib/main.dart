import 'package:flutter/material.dart';
import 'package:bookmark/data/route_generator.dart';
import 'UI/home_screen.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bookmark',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
