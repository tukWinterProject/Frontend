import 'package:flutter/material.dart';
import 'package:moviereport/src/Dummy/movie_list_screen_dummy.dart';
import 'package:moviereport/src/Dummy/review_screen_dummy.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Movie extends StatefulWidget {
  final int movie_id;
  const Movie({super.key, required this.movie_id});

  @override
  State<Movie> createState() => _MovieState();
}

class _MovieState extends State<Movie> {
  MovieDummy? movieData;

  @override
  void initState() {
    super.initState();
    fetchMovies();
    print("초기 영화 로드"); // 초기 데이터 로드
  }

  Future<void> fetchMovies() async {
    try {
      // 서버로부터 데이터를 불러오는 GET 요청
      var response = await http
          .get(Uri.parse('http://localhost:3000/api/movie/${widget.movie_id}'));
      if (response.statusCode == 200) {
        print('무비 가져오기 성공');
        Map<String, dynamic> data = json.decode(response.body);
        setState(() {
          movieData = MovieDummy(
            id: data['id'],
            user_id: data['user_id'],
            showing: data['showing'], // showing을 bool로 변환
            title: data['title'],
            release_date: data['release_date'],
            genre: data['genre'],
            end_date: data['end_date'],
            image_url: data['image_url'],
          );
        });
        print(movieData?.id);
      } else {
        print('Failed to load movie data');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Color.fromRGBO(236, 236, 236, 1.0),
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 10,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 23),
                  child: Text("movieData.title",
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold)),
                ),
                Row(
                  children: [
                    Padding(
                        padding: EdgeInsets.fromLTRB(30, 10, 10, 0),
                        child: Text(movieData?.showing == 1 ? "상영중" : "상영종료",
                            style: TextStyle(
                              color: const Color.fromRGBO(255, 55, 67, 20),
                              fontSize: 15.0,
                            ))),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                          movieData?.showing != 1
                              ? "movieData?.release_date"
                              : "movieData?.release_date ~ movieData?.end_date",
                          style: TextStyle(
                            color: Color.fromRGBO(175, 175, 175, 1),
                            fontSize: 12.0,
                          )),
                    ),
                  ],
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 90, 0, 0),
              child: Text("movieData?.genre",
                  style: TextStyle(
                    color: Color.fromRGBO(175, 175, 175, 1),
                    fontSize: 13.0,
                  )),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.fromLTRB(5, 10, 10, 10),
                width: 100,
                height: 150,
                child: Image.asset(
                  "movieData.image_url",
                  fit: BoxFit.cover,
                ),
              ),
            )
          ],
        ));
  }
}
