import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:moviereport/src/screen/feed/movie_list_screen.dart';
import 'dart:convert';
import 'package:moviereport/src/screen/widget/MovieRegister/label.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class MovieRegisterScreen extends StatefulWidget {
  const MovieRegisterScreen({super.key});

  @override
  State<MovieRegisterScreen> createState() => _MovieRegisterScreenState();
}

class _MovieRegisterScreenState extends State<MovieRegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final storage = FlutterSecureStorage();

  List<String> genres = [
    'Action',
    'Comedy',
    'Drama',
    'Sci-Fi',
    'Romance',
    'Horror'
  ];

  // Form fields
  String title = '';
  String releaseDate = '';
  String endDate = '';
  bool showing = true;
  String genre = '';
  String imageUrl = '';

  void selectShowing(bool selectedShowing) {
    setState(() {
      showing = selectedShowing;
    });
  }

  void selectGenre(String selectedGenre) {
    setState(() {
      this.genre = selectedGenre; // 선택된 장르로 상태 업데이트
      genre = selectedGenre;
    });
    // print('ㅉㅏㅇ르  ${genre}');
  }

  void pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        imageUrl = pickedFile.path; // 파일의 경로(URL) 저장
      });
    }
  }

  Future<void> submitForm() async {
    final token = await storage.read(key: 'access_token');

    var response = await http.post(
      Uri.parse('YOUR_API_ENDPOINT'), // Replace with your API endpoint
      headers: <String, çString>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token', // Add token to the request header
      },
      body: jsonEncode(<String, dynamic>{
        'title': title,
        'release_date': releaseDate,
        'end_date': endDate,
        'showing': showing,
        'genre': genre,
        'image_url': imageUrl,
      }),
    );

    if (response.statusCode == 200) {
      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("성공"),
            content: Text("영화등록에 성공하였습니다"),
            actions: <Widget>[
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(255, 55, 67, 1),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MovieListScreen()));
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
            content: Text("영화등록에 실패하였습니다"),
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
  }

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
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding:
                EdgeInsets.only(top: 50, bottom: 15.0, left: 30.0, right: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // 세로 정렬 방향 설정
              children: [
                Text("영화 등록",
                    style:
                        TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
                Label(title: "영화 제목"),
                TextFormField(
                  style: TextStyle(fontSize: 10, decorationThickness: 0),
                  onSaved: (value) => title = value ?? '',
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                          color: Color.fromRGBO(193, 193, 193, 1),
                          width: 1.0,
                        )),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                          color: Color.fromRGBO(193, 193, 193, 1),
                          width: 1.0,
                        )),
                    hintText: "영화 제목을 입력해주세요",
                    isDense: true,
                    contentPadding: EdgeInsets.all(12),
                  ),
                ),
                Label(title: "영화 장르"),
                Wrap(
                  direction: Axis.horizontal, // 나열 방향
                  alignment: WrapAlignment.start, // 정렬 방식
                  spacing: 3, // 좌우 간격
                  runSpacing: 10, // 상하 간격
                  children: [
                    ...genres
                        .map((g) => Padding(
                            padding: EdgeInsets.only(right: 20),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size(110, 45),
                                primary: genre == g
                                    ? Color.fromRGBO(255, 55, 67, 1)
                                    : Color.fromARGB(255, 255, 255, 255),
                              ),
                              onPressed: () => selectGenre(g),
                              child: Text(
                                g,
                                style: TextStyle(
                                  color: genre == g
                                      ? Colors.white
                                      : Color.fromRGBO(255, 55, 67, 1),
                                  fontSize: 12.0,
                                ),
                              ),
                            )))
                        .toList(),
                  ],
                ),
                Label(title: "시작 상영일"),
                TextFormField(
                  style: TextStyle(fontSize: 10, decorationThickness: 0),
                  onSaved: (value) => releaseDate = value ?? '',
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                          color: Color.fromRGBO(193, 193, 193, 1),
                          width: 1.0,
                        )),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                          color: Color.fromRGBO(193, 193, 193, 1),
                          width: 1.0,
                        )),
                    hintText: "상영 시작일을 입력해주세요",
                    isDense: true,
                    contentPadding: EdgeInsets.all(12),
                  ),
                ),
                Label(title: "상영 종료일"),
                TextFormField(
                  style: TextStyle(fontSize: 10, decorationThickness: 0),
                  onSaved: (value) => endDate = value ?? '',
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                          color: Color.fromRGBO(193, 193, 193, 1),
                          width: 1.0,
                        )),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                          color: Color.fromRGBO(193, 193, 193, 1),
                          width: 1.0,
                        )),
                    hintText: "상영 종료일을 입력해주세요",
                    isDense: true,
                    contentPadding: EdgeInsets.all(12),
                  ),
                ),
                Label(title: "상영 여부"),
                Wrap(
                  direction: Axis.horizontal, // 나열 방향
                  alignment: WrapAlignment.start, // 정렬 방식
                  spacing: 10, // 좌우 간격
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: showing
                            ? Color.fromRGBO(255, 55, 67, 1)
                            : Color.fromARGB(255, 255, 255, 255),
                      ),
                      onPressed: () => selectShowing(true),
                      child: Text(
                        "상영중",
                        style: TextStyle(
                          color: showing
                              ? Colors.white
                              : Color.fromRGBO(255, 55, 67, 1),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: !showing
                            ? Color.fromRGBO(255, 55, 67, 1)
                            : Color.fromARGB(255, 255, 255, 255),
                      ),
                      onPressed: () => selectShowing(false),
                      child: Text(
                        "상영 종료",
                        style: TextStyle(
                          color: !showing
                              ? Colors.white
                              : Color.fromRGBO(255, 55, 67, 1),
                        ),
                      ),
                    ),
                  ],
                ),
                Label(title: "포스터 등록"),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(255, 55, 67, 1),
                  ),
                  onPressed: pickImage,
                  child: Text("파일 업로드",
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 13.0,
                      )),
                ),
                SizedBox(height: 20),
                imageUrl.isNotEmpty
                    ? Image.file(File(imageUrl))
                    : Text("No image selected"),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 70, 0, 40),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 40),
                      backgroundColor: Color.fromRGBO(255, 55, 67, 1),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        submitForm();
                      }
                    },
                    child: Text(
                      "등록하기",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
