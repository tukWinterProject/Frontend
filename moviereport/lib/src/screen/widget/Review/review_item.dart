import 'package:flutter/material.dart';
import 'package:moviereport/src/Dummy/review_screen_dummy.dart';

class ReviewItem extends StatelessWidget {
  final ReviewsDummy reviews;
  const ReviewItem({super.key, required this.reviews});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Color.fromRGBO(227, 227, 227, 1),
              width: 1,
            ),
          ),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          Container(
            padding: EdgeInsets.fromLTRB(8, 10, 0, 0),
            width: double.infinity,
            child: Text(
              reviews.name,
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 14),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(9, 10, 0, 0),
            width: double.infinity,
            child: Text(
              reviews.content,
              style: TextStyle(fontSize: 12),
              // controller: _reviewController,
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
            width: 90,
            child: Text(
              reviews.created_at,
              style: TextStyle(
                  fontSize: 10, color: Color.fromRGBO(175, 175, 175, 1)),
              // controller: _reviewController,
            ),
          )
        ]));
  }
}
