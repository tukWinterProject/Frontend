import 'package:flutter/material.dart';
import 'package:moviereport/src/Dummy/review_screen_dummy.dart';
import 'package:moviereport/src/screen/widget/Review/review_item.dart';

class ReviewForm extends StatefulWidget {
  const ReviewForm({super.key});

  @override
  State<ReviewForm> createState() => _ReviewFormState();
}

class _ReviewFormState extends State<ReviewForm> {
  final TextEditingController _reviewController = TextEditingController();
  // 리뷰 입력 내용을 가져오거나 , 변경하는데에 사용
  // List<String> reviews = []; // 서버에서 가져온 리뷰들 모아둠

  // @override
  // void dispose() { //메모리 누수를 위해..?
  //   _controller.dispose();
  //   super.dispose();
  // }

  // void _submitReview() async {
  //   String reviewText = _controller.text;
  //   // 서버로 리뷰 전송
  //   var response = await http.post(
  //     Uri.parse('https://your-server.com/reviews'), // 서버 URL
  //     body: {'review': reviewText},
  //   );

  //   if (response.statusCode == 200) {
  //     // 리뷰 등록 성공, 새로운 리뷰 목록을 받아옴
  //     _fetchReviews();
  //   } else {
  //     // 에러 처리
  //     print('Failed to submit review');
  //   }
  // }

  // void _fetchReviews() async { // 리뷰 받아옴
  //   var response = await http.get(Uri.parse('https://your-server.com/reviews'));
  //   if (response.statusCode == 200) {
  //     setState(() {
  //       reviews = List<String>.from(json.decode(response.body));
  //     });
  //   } else {
  //     // 에러 처리
  //     print('Failed to fetch reviews');
  //   }
  // }
//입력 받을 변수
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
          height: 100,
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 255, 255, 255),
            border: Border.all(color: Color.fromRGBO(227, 227, 227, 1)),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(children: [
            Container(
              padding: EdgeInsets.fromLTRB(8, 5, 0, 0),
              width: double.infinity,
              child: Text(
                "부리부",
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 14),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 2),
              child: TextFormField(
                style: TextStyle(fontSize: 10),
                controller: _reviewController,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "감상평을 남겨보세요",
                  isDense: true,
                  contentPadding: EdgeInsets.all(7),
                ),
              ),
            )
          ])),
      Container(
          margin: EdgeInsets.only(left: 280),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 236, 19, 19),
              ),
              // onPressed: _submitReview,
              onPressed: () {},
              child: Text("등록하기",
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 12.0,
                  )))),
      Container(
          margin: EdgeInsets.only(top: 50),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 236, 19, 19),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Container(
              margin: EdgeInsets.only(top: 13),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: List.generate(dummyReviws.length, (index) {
                      return ReviewItem(reviews: dummyReviws[index]);
                    }),
                  ),
                ],
              )))
    ]);
  }
}
