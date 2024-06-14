import 'package:flutter/material.dart';
import 'package:pmusic/view/cart_screen.dart';
import 'package:pmusic/view/favorite_screen.dart';
import 'package:pmusic/view/home_page.dart';
import 'package:pmusic/view/profile_screen.dart';

import 'adio_player.dart';
import 'player_screen.dart';
import 'search_screen.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});
  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _selectedIndex = 2;

  List<StatefulWidget> pages = const [
    Player(),
    PlayerPage(),
    HomePage(),
    CartPage(),
    ProfilePage(),
  ];

  void onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(19, 19, 19, 1),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color.fromRGBO(19, 19, 19, 1),
        selectedItemColor: const Color.fromRGBO(230, 154, 21, 1),
        unselectedItemColor: const Color.fromRGBO(157, 178, 206, 1),
        onTap: onItemTapped,
        currentIndex: _selectedIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border_outlined),
            label: "Favorite",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_rounded),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.music_note),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
      body: pages[_selectedIndex],
    );
  }
}
