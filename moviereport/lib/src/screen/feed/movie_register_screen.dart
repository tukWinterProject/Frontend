import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:moviereport/src/screen/widget/MovieRegister/label.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:http_parser/http_parser.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  int showing = 0;
  String genre = '';
  String image_url = '';

  void selectShowing(int selectedShowing) {
    setState(() {
      showing = selectedShowing;
    });
  }

  void selectGenre(String selectedGenre) {
    setState(() {
      genre = selectedGenre;
    });
  }

  void pickImage() async {
    try {
      final pickedFile =
          await ImagePicker().pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        setState(() {
          image_url = pickedFile.path;
        });
      }
    } catch (e) {
      print('파일 선택 중 오류 발생: $e');
    }
  }

  Future<String> uploadImage(String imagePath) async {
    var uri = Uri.parse('http://localhost:3000/api/file/upload');
    var request = http.MultipartRequest('POST', uri);

    var imageFile = await http.MultipartFile.fromPath(
      'image',
      imagePath,
      contentType: MediaType('image', 'jpeg'),
    );

    request.files.add(imageFile);

    var response = await request.send();

    if (response.statusCode == 200) {
      var responseData = await response.stream.toBytes();
      var responseString = String.fromCharCodes(responseData);
      print("Response: $responseString");
      return responseString;
    } else {
      throw Exception('이미지 업로드 실패');
    }
  }

  Future<void> submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      try {
        String imageUrl = '';
        if (image_url.isNotEmpty) {
          imageUrl = await uploadImage(image_url);
        }

        SharedPreferences prefs = await SharedPreferences.getInstance();
        String? token = prefs.getString('token');

        var response = await http.post(
          Uri.parse('http://localhost:3000/api/movie/register'),
          headers: <String, String>{
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
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
                      Navigator.of(context).pop();
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
        } else {
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
        }
      } catch (e) {
        print('Error: $e');
      }
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
                        primary: showing == 1
                            ? Color.fromRGBO(255, 55, 67, 1)
                            : Color.fromARGB(255, 255, 255, 255),
                      ),
                      onPressed: () => selectShowing(1),
                      child: Text(
                        "상영중",
                        style: TextStyle(
                          color: showing == 1
                              ? Colors.white
                              : Color.fromRGBO(255, 55, 67, 1),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: showing == 0
                            ? Color.fromRGBO(255, 55, 67, 1)
                            : Color.fromARGB(255, 255, 255, 255),
                      ),
                      onPressed: () => selectShowing(0),
                      child: Text(
                        "상영 종료",
                        style: TextStyle(
                          color: showing == 0
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
                image_url.isNotEmpty
                    ? Image.file(File(image_url))
                    : Text("No image selected"),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 70, 0, 40),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 40),
                      backgroundColor: Color.fromRGBO(255, 55, 67, 1),
                    ),
                    onPressed: () {
                      submitForm();
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
