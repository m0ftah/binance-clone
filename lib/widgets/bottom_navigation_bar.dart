import 'package:flutter/material.dart';
import 'package:tnance/helper/constans.dart';
import 'package:tnance/screens/drawer_screens/profile_screen.dart';
import 'package:tnance/screens/main_screens/home_screen.dart';
import 'package:tnance/screens/main_screens/search_screen.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  const BottomNavigationBarWidget({
    super.key,
  });

  @override
  State<BottomNavigationBarWidget> createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currentIndex == 0
          ? const HomeScreen()
          : currentIndex == 1
              ? SearchScreen()
              : const ProfileScreen(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        backgroundColor: primaryColor,
        selectedItemColor: seconderycolor,
        unselectedItemColor: base2,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
