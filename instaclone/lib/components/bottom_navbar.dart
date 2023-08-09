import 'package:flutter/material.dart';
import '../screens/add_screen/add_screen.dart';
import '../screens/home_screen/home_screen.dart';
import '../screens/profile_screen/profile_screen.dart';
import '../screens/reels_screen/reels_screen.dart';
import '../screens/search_screen/search_screen.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int currentIndex = 0;

  final List<Widget> screens = [
    const HomeScreen(),
    const SearchScreen(),
    const AddScreen(),
    const ReelsScreen(),
    const ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color.fromARGB(255, 0, 0, 0),
        unselectedItemColor: const Color.fromARGB(255, 50, 46, 47),
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
            icon:
                Icon(currentIndex == 1 ? Icons.search : Icons.search_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
                currentIndex == 2 ? Icons.add_box : Icons.add_box_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(currentIndex == 3
                ? Icons.movie_sharp
                : Icons.movie_creation_sharp),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(currentIndex == 4 ? Icons.person : Icons.person_outline),
            label: '',
          ),
        ],
      ),
    );
  }
}
