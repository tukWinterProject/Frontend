import 'package:flutter/material.dart';
import 'package:moviereport/src/Dummy/movie_list_screen_dummy.dart';
import 'package:moviereport/src/screen/widget/MovieList/movie_item.dart';

class MovieListScreen extends StatelessWidget {
  const MovieListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 50, bottom: 15.0, left: 30.0),
          child: Text('영화 목록',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
        ),
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