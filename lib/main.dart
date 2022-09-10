import 'package:flutter/material.dart';
import 'package:movie_app/home/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        HomeScreen.RouteName: (_) => HomeScreen(),
      },
      initialRoute: HomeScreen.RouteName,
    );
  }
}
