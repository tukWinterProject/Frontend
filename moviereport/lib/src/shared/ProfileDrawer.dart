import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileDrawer extends StatefulWidget {
  const ProfileDrawer({Key? key}) : super(key: key);

  @override
  _ProfileDrawerState createState() => _ProfileDrawerState();
}

class _ProfileDrawerState extends State<ProfileDrawer> {
  final String userProfileImage = 'images/people.png';
  late String name = '';

  @override
  void initState() {
    super.initState();
    _loadUserInfo();
  }

  Future<void> _loadUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedToken = prefs.getString('token');

    print('로컬에 저장된 토큰: $savedToken');

    if (savedToken != null) {
      try {
        Map<String, dynamic> decodedToken = _decodeToken(savedToken);

        setState(() {
          name = decodedToken['name'] ?? 'error';
        });
      } catch (error) {
        print('토큰 디코딩 도중 오류 발생: $error');
        setState(() {
          name = 'error';
        });
      }
    } else {
      setState(() {
        name = 'GUEST';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: buildMenuItems(context),
      ),
    );
  }

  List<Widget> buildMenuItems(BuildContext context) {
    final List<String> menuTitles = ['내 영화', '로그아웃'];
    List<Widget> menuItems = [];

    menuItems.add(
      DrawerHeader(
        decoration: BoxDecoration(
          color: Color(0xffFF3743),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: 10),
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(userProfileImage),
            ),
            SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 40,
                ),
                Text(
                  name,
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
              ],
            ),
          ],
        ),
      ),
    );

    for (var title in menuTitles) {
      menuItems.add(
        ListTile(
          title: Text(title, style: const TextStyle(fontSize: 18)),
          onTap: () {},
        ),
      );
    }

    return menuItems;
  }

  Map<String, dynamic> _decodeToken(String token) {
    final Map<String, dynamic> decodedToken = json.decode(
      utf8.decode(base64.decode(base64.normalize(token.split(".")[1]))),
    );
    return decodedToken;
  }
}
