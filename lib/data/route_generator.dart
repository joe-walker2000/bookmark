import 'package:flutter/material.dart';
import 'package:bookmark/UI/details_screen.dart';
import '../UI/home_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomeScreen(args));
      case '/details':
        return MaterialPageRoute(builder: (_) => DetailsScreen(data: args));
      default:
        return MaterialPageRoute(builder: (_) => HomeScreen(args));
    }
  }
}
