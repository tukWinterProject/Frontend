import 'package:flutter/material.dart';
import 'package:moviereport/src/screen/feed/page1.dart';
import 'package:moviereport/src/shared/ProfileDrawer.dart';
import 'package:moviereport/src/screen/feed/movie_list_screen.dart';
import 'package:moviereport/src/screen/feed/my_movie_screen.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
            appBar: AppBar(
              title: Text(
                'Movie Report',
                style: TextStyle(
                    color: Color(0xffFF3743), fontWeight: FontWeight.bold),
              ),
              centerTitle: true,
              backgroundColor: Color(0xFFF0F0F0),
              elevation: 0,
            ),
            drawer: ProfileDrawer(),
            bottomNavigationBar: Container(
              color: const Color.fromRGBO(240, 240, 240, 1), // TabBar 배경색 설정
              child: TabBar(
                indicatorColor: Colors.transparent, // 선택된 탭 밑줄 색상
                labelColor: const Color.fromRGBO(255, 55, 67, 1), // 선택된 탭 색상
                unselectedLabelColor:
                    const Color.fromRGBO(175, 175, 175, 1), // 선택되지 않은 탭 색상
                tabs: const [
                  Tab(icon: Icon(Icons.home), text: '홈'),
                  Tab(icon: Icon(Icons.format_list_bulleted), text: '영화 목록'),
                  Tab(icon: Icon(Icons.movie), text: '내영화'),
                ],
              ),
            ),
            body: Container(
              color: Color.fromARGB(255, 255, 255, 255),
              child: TabBarView(
                children: const [
                  Page1(),
                  MovieListScreen(),
                  Page3(),
                ],
              ),
            )));
  }
}

void main() {
  runApp(
    MaterialApp(
      home: Home(),
    ),
  );
}
