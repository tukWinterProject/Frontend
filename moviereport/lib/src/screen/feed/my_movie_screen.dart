import 'package:flutter/material.dart';
import 'package:moviereport/src/Dummy/my_movie_screen_dummy.dart';
import 'package:moviereport/src/screen/widget/MyMovie/my_movie_item.dart';

class Page3 extends StatelessWidget {
  const Page3({super.key});

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
            itemCount: dummyMyMoviesList.length,
            itemBuilder: (context, index) {
              return MyMovieItem(
                  movie: dummyMyMoviesList[
                      index]); // 각 MovieItem에 Movie 객체를 전달합니다.
            },
          ),
        ),
      ],
    );
  }
}
