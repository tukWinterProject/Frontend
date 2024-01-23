import 'package:flutter/material.dart';
import 'package:moviereport/src/Dummy/review_screen_dummy.dart';
import 'package:moviereport/src/screen/widget/Review/movie.dart';
import 'package:moviereport/src/screen/widget/Review/review_form.dart';

class Reviews extends StatelessWidget {
  final int movieId;
  const Reviews({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context); //뒤로가기
          },
          color: const Color.fromRGBO(255, 55, 67, 20),
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // 세로 정렬 방향 설정
          children: [
            Padding(
              padding: EdgeInsets.only(top: 50, bottom: 15.0, left: 30.0),
              child: Text("리뷰",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
            ),
            Movie(
              movie_id: movieId,
            ),
            ReviewForm(
              movie_id: movieId,
            ),
          ],
        ),
      ),
    );
  }
}
