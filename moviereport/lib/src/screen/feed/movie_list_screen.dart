import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:moviereport/src/Dummy/movie_list_screen_dummy.dart';
import 'package:moviereport/src/screen/feed/movie_register_screen.dart';
import 'package:moviereport/src/screen/widget/MovieList/movie_item.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class MovieListScreen extends StatefulWidget {
  const MovieListScreen({super.key});

  @override
  State<MovieListScreen> createState() => _MovieListScreenState();
}

class _MovieListScreenState extends State<MovieListScreen> {
  List<MovieListDummy> moviesList = [];
  final storage = FlutterSecureStorage();

  @override
  void initState() {
    super.initState();
    fetchMovies();
    print("영화 리스트 불러오기 성ㄴ"); // 초기 데이터 로드
  }

  Future<void> fetchMovies() async {
    try {
      // 서버로부터 데이터를 불러오는 GET 요청
      var response =
          await http.get(Uri.parse('http://localhost:3000/api/movie'));
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);

        setState(() {
          moviesList = data.map((movieData) {
            return MovieListDummy(
              id: movieData['id'],
              user_id: movieData['user_id'],
              showing: movieData['showing'],
              title: movieData['title'],
              release_date: movieData['release_date'],
              genre: movieData['genre'],
              end_date: movieData['end_date'],
              image_url: movieData['image_url'],
            );
          }).toList();
        });
      } else {
        print('Failed to load movie data');
      }
    } catch (e) {
      print('Errossr: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
            child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 50, bottom: 15.0, left: 30.0),
              child: Text('영화 목록',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(80, 30, 0, 0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 236, 19, 19),
                  elevation: 10,
                  onPrimary: Colors.black.withOpacity(0.2),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MovieRegisterScreen()));
                },
                child: Text("내 영화 등록하러 가기",
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 12.0,
                    )),
              ),
            ),
          ],
        )),
        Expanded(
          child: ListView.builder(
            itemCount: moviesList.length,
            itemBuilder: (context, index) {
              return MovieItem(
                  movie: moviesList[index]); // 각 MovieItem에 Movie 객체를 전달합니다.
            },
          ),
        ),
      ],
    );
  }
}
