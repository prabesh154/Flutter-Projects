import 'package:flutter/material.dart';
import 'package:myapp/models/tab_listtiles_models.dart';
import 'package:myapp/pages/bookmarks_screen/bookmarks_screen.dart';
import 'package:myapp/pages/home_screen/home_screen.dart';

import '../../settings_screen/settings_screen.dart';
import '../../shop_screen/shop_screen.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int currentIndex = 0;

  final List<Widget> screens = [
    const HomeScreen(),
    const BookmarksScreen(),
    // ignore: prefer_const_constructors
    const ShopScreen(), // Pass the dataList to ShopScreen

    const SettingsScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color.fromARGB(255, 242, 55, 105),
        unselectedItemColor: const Color.fromARGB(255, 245, 99, 138),
        currentIndex: currentIndex,
        onTap: (index) {
          // Handle bottom navigation item tap
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(currentIndex == 0 ? Icons.home : Icons.home_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
                currentIndex == 1 ? Icons.bookmark : Icons.bookmark_outline),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(currentIndex == 2
                ? Icons.shopping_bag
                : Icons.shopping_bag_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
                currentIndex == 3 ? Icons.settings : Icons.settings_outlined),
            label: '',
          ),
        ],
      ),
    );
  }
}
