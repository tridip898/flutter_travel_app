import 'package:flutter_travel_app/pages/profile_page.dart';
import 'package:flutter_travel_app/pages/search_page.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'bar_item_page.dart';
import 'home_screen.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex=0;
  void changeTab(int index){
    setState(() {
      _selectedIndex=index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          iconSize: 29,
          selectedItemColor: Colors.blueGrey,
          unselectedItemColor: Colors.grey.shade500,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          elevation: 0,
          currentIndex: _selectedIndex,
          onTap: changeTab,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home_filled),label: "Home",backgroundColor: Colors.white),
            BottomNavigationBarItem(icon: Icon(Icons.bar_chart),label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.search),label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.person_outline_rounded),label: "Home"),
          ],
        ),
        body: IndexedStack(
          index: _selectedIndex,
          children: [
            HomeScreen(),
            BarItemPage(),
            SearchPage(),
            ProfilePage()
          ],
        ),
      ),
    );
  }
}
