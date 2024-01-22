import 'package:flutter/material.dart';
import 'package:moviereport/src/screen/register/login.dart';
import 'package:http/http.dart' as http;

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  final RegExp emailRegex =
      RegExp(r'^[a-zA-Z0-9_+.-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$');

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      final String email = _emailController.text;
      final String password = _passwordController.text;
      final String name = _nameController.text;

      final response = await http.post(
        Uri.parse("http://localhost:3000/api/user/register"),
        body: {
          'email': email,
          'password': password,
          'name': name,
        },
      );
      if (response.statusCode == 200) {
        print("회원가입 성공!!");
      } else {
        print("회원가입 실패... ${response.statusCode} ${response.body}");
      }
      // 회원가입 로직 추가
      // 회원가입 성공 시, 다음 화면으로 이동 혹은 처리
    }
  }

  void _goToLoginPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Login()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Movie Report',
          style:
              TextStyle(color: Color(0xffFF3743), fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFFF0F0F0),
        elevation: 0,
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(50.0),
            children: [
              SizedBox(height: 80),
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'NICKNAME',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '닉네임을 입력하세요.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'EMAIL',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '이메일을 입력하세요.';
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
                  // 추가적인 비밀번호 유효성 검사 로직 추가 가능
                  return null;
                },
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: _submitForm,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffFF3743),
                  minimumSize: Size(double.infinity, 50),
                ),
                child: const Text(
                  '회원 가입',
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
                  const Text('이미 회원이신가요?'),
                  TextButton(
                    onPressed: _goToLoginPage,
                    child: const Text(
                      '로그인',
                      style: TextStyle(
                        color: Color(0xffFF3743),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
