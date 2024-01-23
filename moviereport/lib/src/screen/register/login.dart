import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:moviereport/src/screen/feed/page1.dart';
import 'package:moviereport/src/screen/home.dart';
import 'package:moviereport/src/screen/register/register.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final RegExp emailRegex =
      RegExp(r'^[a-zA-Z0-9_+.-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$');

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      final String email = _emailController.text;
      final String password = _passwordController.text;

      final String apiUrl = 'http://localhost:3000/api/user/login';
      final Map<String, String> requestData = {
        'email': email,
        'password': password,
      };

      final http.Response response = await http.post(
        Uri.parse('http://localhost:3000/api/user/login'),
        body: requestData,
      );

      if (response.statusCode == 200) {
        print('로그인 성공!!');

        // 기존에 홈 화면이 스택에 있는지 확인
        bool homeScreenExists = false;
        Navigator.popUntil(context, (route) {
          if (route.settings.name == '/') {
            homeScreenExists = true;
          }
          return true;
        });

        // 기존에 홈 화면이 스택에 없으면 새로운 홈 화면 추가
        if (!homeScreenExists) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Home()),
          );
        }
      } else {
        print('로그인 실패...');
      }
    }
  }

  void _goToRegisterPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Register()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Movie Report',
          style: TextStyle(
            color: Color(0xffFF3743),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFFF0F0F0),
        elevation: 0,
      ),
      body: Form(
        key: _formKey,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 50),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'ID',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '아이디를 입력하세요.';
                    }
                    if (!emailRegex.hasMatch(value)) {
                      return '이메일 형식에 맞지 않습니다.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'PASSWORD',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '비밀번호를 입력하세요.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _submitForm,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffFF3743),
                    minimumSize: Size(double.infinity, 50),
                  ),
                  child: const Text(
                    '로그인',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('회원이 아니신가요?'),
                    TextButton(
                      onPressed: _goToRegisterPage,
                      child: const Text(
                        '회원가입',
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
