import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:moviereport/src/Dummy/movie_list_screen_dummy.dart';
import 'package:moviereport/src/screen/widget/MyMovie/my_movie_item.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class MyMovieScreen extends StatefulWidget {
  const MyMovieScreen({super.key});

  @override
  State<MyMovieScreen> createState() => _MyMovieScreen();
}

class _MyMovieScreen extends State<MyMovieScreen> {
  List<MovieListDummy> moviesList = [];
  final storage = FlutterSecureStorage();

  @override
  void initState() {
    super.initState();
    fetchMovies(); // 초기 데이터 로드
  }

  Future<void> fetchMovies() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');
      // 서버로부터 데이터를 불러오는 GET 요청
      var response = await http.get(
        Uri.parse('http://localhost:3000/api/movie/my'),
        // 헤더에 토큰 추가
        headers: {
          'Authorization': 'Bearer ${token}',
        },
      );

      if (response.statusCode == 200) {
        print("내 영화 리스트 불러오기 성ㄴ");
        List<dynamic> data = json.decode(response.body);
        print(data);
        setState(() {
          moviesList = data.map((movieData) {
            return MovieListDummy(
              id: movieData['id'],
              user_id: movieData[' user_id'],
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
        Padding(
          padding: EdgeInsets.only(top: 50, bottom: 15.0, left: 30.0),
          child: Text('내 영화',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: moviesList.length,
            itemBuilder: (context, index) {
              return MyMovieItem(
                  movie: moviesList[index]); // 각 MovieItem에 Movie 객체를 전달합니다.
            },
          ),
        ),
      ],
    );
  }
}
