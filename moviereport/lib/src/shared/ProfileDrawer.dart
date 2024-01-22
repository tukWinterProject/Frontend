import 'package:flutter/material.dart';

class ProfileDrawer extends StatelessWidget {
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
    final List<String> menuTitles = ['내 영화', '내 리뷰', '로그아웃'];
    List<Widget> menuItems = [];

    menuItems.add(
      DrawerHeader(
        decoration: BoxDecoration(color: Color(0xffFF3743)),
        child: Text(
          '내 정보',
          style: TextStyle(color: Colors.white, fontSize: 20),
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
