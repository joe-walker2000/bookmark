import 'package:flutter/material.dart';
import 'package:bookmark/main.dart';
import 'package:bookmark/details_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomePage());
      case '/details':
        return MaterialPageRoute(builder: (_) => DetailsPage(data: args));
      default:
        return MaterialPageRoute(builder: (_) => HomePage());
    }
  }
}
