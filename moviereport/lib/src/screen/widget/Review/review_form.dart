import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:moviereport/src/Dummy/review_screen_dummy.dart';
import 'package:moviereport/src/screen/widget/Review/review_item.dart';
import 'package:http/http.dart' as http;

class ReviewForm extends StatefulWidget {
  final int movie_id;
  const ReviewForm({super.key, required this.movie_id});

  @override
  State<ReviewForm> createState() => _ReviewFormState();
}

class _ReviewFormState extends State<ReviewForm> {
  final _formKey = GlobalKey<FormState>();
  final storage = FlutterSecureStorage();

  String content = '';
  List<ReviewsDummy> reviwsList = [];
  // 리뷰 입력 내용을 가져오거나 , 변경하는데에 사용
  // List<String> reviews = []; // 서버에서 가져온 리뷰들 모아둠

  @override
  void initState() {
    super.initState();
    fetchMovies(); // 초기 데이터 로드
  }

  Future<void> submitForm() async {
    try {
      final token = await storage.read(key: 'access_token');

      var response = await http.post(
        Uri.parse(
            'http://localhost:3000/api/review/${widget.movie_id}'), // Replace with your API endpoint
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token', // Add token to the request header
        },
        body: jsonEncode(<String, dynamic>{
          'content': content,
        }),
      );

      if (response.statusCode == 200) {
        // 리뷰 등록 성공, 새로운 리뷰 목록을 받아옴
        //     _fetchReviews();
        // ignore: use_build_context_synchronously
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("성공"),
              content: Text("리뷰등록에 성공하였습니다"),
              actions: <Widget>[
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(255, 55, 67, 1),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                    // Navigate to second page
                  },
                  child: Text(
                    "Ok",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            );
          },
        );
        // Handle the response
        print('Success: ${response.body}');
      } else {
        print('Error: ${response.statusCode}');
        // ignore: use_build_context_synchronously
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("실패"),
              content: Text("리뷰등록에 실패하였습니다"),
              actions: <Widget>[
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(255, 55, 67, 1),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                    // Navigate to second page
                  },
                  child: Text(
                    "Ok",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            );
          },
        );
        // Handle the error
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> fetchMovies() async {
    try {
      // 서버로부터 데이터를 불러오는 GET 요청
      var response = await http.get(
          Uri.parse('http://localhost:3000/api/review/${widget.movie_id}'));
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);

        setState(() {
          reviwsList = data.map((data) {
            return ReviewsDummy(
              name: data['name'],
              created_at: data['created_at'],
              content: data['content'],
            );
          }).toList();
        });
      } else {
        print('Failed to load movie data');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

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
                onSaved: (value) => content = value ?? '',
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
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  submitForm();
                }
              },
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
                    children: List.generate(reviwsList.length, (index) {
                      return ReviewItem(reviews: reviwsList[index]);
                    }),
                  ),
                ],
              )))
    ]);
  }
}
