import 'package:flutter/material.dart';
import 'package:moviereport/src/screen/home.dart';

class MyApp extends StatelessWidget {
  // 세팅을 위한 문법
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      //Theme ,Router등 정의
      home: Home(),
    );
  }
}
