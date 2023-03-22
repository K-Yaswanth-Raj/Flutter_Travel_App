import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/pages/navpages/bar_item_page.dart';
import 'package:travel_app/pages/navpages/home_page.dart';
import 'package:travel_app/pages/navpages/my_page.dart';
import 'package:travel_app/pages/navpages/search_page.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});
  List pages = [
    HomePage(),
    BarItemPage(),
    SearchPage(),
    MyPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Main Page'),
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black38,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          elevation: 0,
          items: [
            BottomNavigationBarItem(
                label: 'Home',
                icon: Icon(
                  Icons.apps_rounded,
                )),
            BottomNavigationBarItem(
                label: 'Bar',
                icon: Icon(
                  Icons.bar_chart_rounded,
                )),
            BottomNavigationBarItem(
                label: 'Search',
                icon: Icon(
                  Icons.search_rounded,
                )),
            BottomNavigationBarItem(
                label: 'My',
                icon: Icon(
                  Icons.person_2_rounded,
                )),
          ],
        ),
        body: pages[0],
      ),
    );
  }
}
