import 'package:flutter/material.dart';
import 'package:moviereport/src/screen/feed/movie_list_screen.dart';
import 'package:moviereport/src/screen/feed/page1.dart';
import 'package:moviereport/src/screen/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Movie Report",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFF0F0F0),
      ),
      routes: {
        "/": (context) => Home(),
        "/movielist": (context) => MovieListScreen(),
        "/page1": (context) => Page1(),
      },
    );
  }
}
