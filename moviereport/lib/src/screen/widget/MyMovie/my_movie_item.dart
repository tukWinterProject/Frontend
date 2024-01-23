import 'package:flutter/material.dart';
import 'package:moviereport/src/Dummy/my_movie_screen_dummy.dart';
import 'package:moviereport/src/screen/feed/movie_modify_screen.dart';
import 'package:moviereport/src/screen/feed/reviews_screen.dart';

class MyMovieItem extends StatelessWidget {
  final MyMovieListDummy movie; // Movie 객체를 추가합니다.
  const MyMovieItem({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        border: Border(
          top:
              BorderSide(color: Color.fromRGBO(236, 236, 236, 1.0), width: 1.2),
        ),
      ),
      child: Row(
        children: [
          Center(
            child: Container(
              width: 100,
              height: 150,
              child: Image.asset(
                movie.image_url,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // 상단 정렬
              children: [
                Container(
                    padding: const EdgeInsets.all(12.0),
                    // 흰색 큰박스
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              height: 50,
                              //정보
                              child: Column(children: [
                                Container(
                                    margin: EdgeInsets.all(10),
                                    child: Row(children: [
                                      Padding(
                                        padding: EdgeInsets.only(right: 6),
                                        child: Text(movie.title,
                                            style: TextStyle(
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                      Text(movie.genre,
                                          style: TextStyle(
                                            color: Color.fromRGBO(
                                                175, 175, 175, 1),
                                            fontSize: 15.0,
                                          )),
                                    ])),
                              ])),
                          Container(
                              margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                              child: Row(children: [
                                Text(movie.showing == 1 ? "상영중" : "상영 종료",
                                    style: TextStyle(
                                      color: const Color.fromRGBO(
                                          255, 55, 67, 20), // 폰트 색상을 빨간색으로 설정
                                      fontSize: 15.0,
                                    )),
                                Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Text(
                                        movie.showing == 1
                                            ? "${movie.release_date} ~ "
                                            : "${movie.end_date} ~ ${movie.release_date}",
                                        style: TextStyle(
                                          color:
                                              Color.fromRGBO(175, 175, 175, 1),
                                          fontSize: 12.0,
                                        )))
                              ])) // 상영중 , 날짜
                        ])),
                Expanded(
                  child: Align(
                      child: Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 20, 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(right: 7),
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          Color.fromARGB(255, 236, 19, 19),
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const MovieModifyScreen()));
                                    },
                                    child: Text("수정",
                                        style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 255, 255, 255),
                                          fontSize: 12.0,
                                        ))),
                              ),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Color.fromARGB(255, 236, 19, 19),
                                  ),
                                  onPressed: () {},
                                  child: Text("삭제",
                                      style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                        fontSize: 12.0,
                                      )))
                            ],
                          ))),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
