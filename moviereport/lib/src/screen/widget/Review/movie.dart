import 'package:flutter/material.dart';
import 'package:moviereport/src/Dummy/review_screen_dummy.dart';

class Movie extends StatelessWidget {
  final MovieDummy movie;
  const Movie({super.key, required this.movie});

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
                  child: Text(movie.title,
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold)),
                ),
                Row(
                  children: [
                    Padding(
                        padding: EdgeInsets.fromLTRB(30, 10, 10, 0),
                        child: Text(movie.isShowing,
                            style: TextStyle(
                              color: const Color.fromRGBO(255, 55, 67, 20),
                              fontSize: 15.0,
                            ))),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(movie.date,
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
              child: Text('장르 : ${movie.genre}',
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
                  movie.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            )
          ],
        ));
  }
}
