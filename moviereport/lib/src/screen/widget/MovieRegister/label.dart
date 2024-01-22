import 'package:flutter/material.dart';

class Label extends StatelessWidget {
  final String title;

  Label({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20, bottom: 10.0),
      child: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.w900),
      ),
    );
  }
}
