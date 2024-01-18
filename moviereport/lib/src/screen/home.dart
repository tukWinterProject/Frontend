import 'package:flutter/material.dart';
import 'package:moviereport/src/screen/feed/page1.dart';
import 'package:moviereport/src/screen/feed/page2.dart';
import 'package:moviereport/src/screen/feed/page3.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
            appBar: AppBar(),
            bottomNavigationBar: const SafeArea(
              child: TabBar(
                tabs: [
                  Tab(icon: Icon(Icons.home), text: '홈'),
                  Tab(icon: Icon(Icons.format_list_bulleted), text: '영화 목록'),
                  Tab(icon: Icon(Icons.movie), text: '내영화'),
                ],
              ),
            ),
            body: const TabBarView(
              children: [
                Page1(),
                Page2(),
                Page3(),
              ],
            )));
  }
}
