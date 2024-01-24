import 'package:flutter/material.dart';
import 'package:moviereport/src/Dummy/movie_list_screen_dummy.dart';
import 'package:moviereport/src/screen/feed/movie_modify_screen.dart';
import 'package:moviereport/src/screen/feed/reviews_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class MyMovieItem extends StatefulWidget {
  final MovieListDummy movie; // Movie 객체를 추가합니다.
  const MyMovieItem({Key? key, required this.movie}) : super(key: key);

  @override
  State<MyMovieItem> createState() => _MyMovieItemState();
}

class _MyMovieItemState extends State<MyMovieItem> {
  // Future<void> deleteData(int movieId) async {
  //   try {
  //     SharedPreferences prefs = await SharedPreferences.getInstance();
  //     String? token = prefs.getString('token');
  //     // 서버로부터 데이터를 불러오는 GET 요청
  //     var response = await http.delete(
  //       Uri.parse('http://localhost:3000/api/movie/${movieId}/delete'),
  //       // 헤더에 토큰 추가
  //       headers: {
  //         'Authorization': 'Bearer ${token}',
  //       },
  //     );
  //     if (response.statusCode == 200) {
  //       print('Deleted Successfully');
  //     } else {
  //       print('Failed to load movie data');
  //     }
  //   } catch (e) {
  //     print('Errossr: $e');
  //   }
  // }

  // Future<void> deleteReview(int movieId) async {
  //   try {
  //     SharedPreferences prefs = await SharedPreferences.getInstance();
  //     String? token = prefs.getString('token');
  //     // 서버로부터 데이터를 불러오는 GET 요청
  //     var response = await http.delete(
  //       Uri.parse('http://localhost:3000/api/review/${movieId}/delete'),
  //       // 헤더에 토큰 추가
  //       headers: {
  //         'Authorization': 'Bearer ${token}',
  //       },
  //     );
  //     if (response.statusCode == 200) {
  //       print('리뷰 Successfully');
  //       deleteData(widget.movie.id);
  //     } else {
  //       print('Failed to load movie data');
  //     }
  //   } catch (e) {
  //     print('Errossr: $e');
  //   }
  // }

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
              child: Image.network(
                widget.movie.image_url,
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
                                        child: Text(widget.movie.title,
                                            style: TextStyle(
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                      Text(widget.movie.genre,
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
                                Text(
                                    widget.movie.showing == 1 ? "상영중" : "상영 종료",
                                    style: TextStyle(
                                      color: const Color.fromRGBO(
                                          255, 55, 67, 20), // 폰트 색상을 빨간색으로 설정
                                      fontSize: 15.0,
                                    )),
                                Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Text(
                                        widget.movie.showing == 1
                                            ? "${widget.movie.release_date.substring(0, widget.movie.release_date.length - 14)} ~ "
                                            : "${widget.movie.release_date.substring(0, widget.movie.release_date.length - 14)} ~${widget.movie.end_date.substring(0, widget.movie.end_date.length - 14)} ",
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
                                                  MovieModifyScreen(
                                                      movie_id:
                                                          widget.movie.id)));
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
                                  onPressed: () => {},
                                  // {deleteReview(widget.movie.id)},
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
