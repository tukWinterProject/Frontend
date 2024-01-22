import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviereport/src/Widgets/PopularItemsWidget.dart';
import 'package:moviereport/src/Widgets/StartItemsWidget.dart';
import 'package:moviereport/src/screen/register/login.dart'; // 로그인 페이지 파일 임포트

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          // AppBarWidget(),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 15,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20, left: 10),
          ),
          StartItemsWidget(),

          // 인기있는 영화
          Padding(
              padding: EdgeInsets.only(top: 20, left: 10),
              child: Text(
                "인기있는 영화",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              )),
          PopularItemsWidget(),
        ],
      ),
    );
  }
}
