import 'package:flutter/material.dart';
import 'package:moviereport/src/screen/home.dart';
import 'package:http/http.dart' as http;

void main() {
  //안에서 구동
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
      },
    );
  }
}
