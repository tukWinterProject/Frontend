import 'package:flutter/material.dart';
import 'package:moviereport/src/Dummy/movie_list_screen_dummy.dart';
import 'package:moviereport/src/screen/feed/movie_register_screen.dart';
import 'package:moviereport/src/screen/widget/MovieList/movie_item.dart';

class MovieListScreen extends StatelessWidget {
  const MovieListScreen({super.key});

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
            itemCount: dummyMoviesList.length,
            itemBuilder: (context, index) {
              return MovieItem(
                  movie:
                      dummyMoviesList[index]); // 각 MovieItem에 Movie 객체를 전달합니다.
            },
          ),
        ),
      ],
    );
  }
}
