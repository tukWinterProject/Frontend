import 'package:flutter/material.dart';

class ProfileDrawer extends StatelessWidget {
  final String userProfileImage = 'images/people.png';
  final String userName = '사용자 닉네임'; // 실제 사용자의 닉네임
  final String userEmail = 'user@example.com'; // 실제 사용자의 이메일

  const ProfileDrawer({Key? key}) : super(key: key);

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
                  userName,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                Text(
                  userEmail,
                  style: TextStyle(color: Colors.white, fontSize: 12),
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
}
