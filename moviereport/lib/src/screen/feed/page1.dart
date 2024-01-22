import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviereport/src/Widgets/PopularItemsWidget.dart';
import 'package:moviereport/src/Widgets/StartItemsWidget.dart';
import 'package:moviereport/src/screen/register/login.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
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
            padding: EdgeInsets.only(top: 20, left: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Row(
                  children: [
                    Text(
                      "인기있는 영화",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 10),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Color(0xffFF3743),
                ),
              ],
            ),
          ),
          PopularItemsWidget(),
        ],
      ),
    );
  }
}
