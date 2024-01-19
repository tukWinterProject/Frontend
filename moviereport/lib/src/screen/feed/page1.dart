import 'package:flutter/material.dart';
import 'package:moviereport/src/screen/register/login.dart'; // 로그인 페이지 파일 임포트

class Page1 extends StatelessWidget {
  const Page1({Key? key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("page1"),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // '시작하기' 버튼이 눌렸을 때 로그인 페이지로 이동
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Login()),
              );
            },
            child: const Text('지금 시작하기'),
          ),
        ],
      ),
    );
  }
}
