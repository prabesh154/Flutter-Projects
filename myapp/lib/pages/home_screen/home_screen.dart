import 'package:flutter/material.dart';
import 'package:myapp/consts/consts.dart';
import 'package:myapp/pages/add_screen/add_screen.dart';
import 'package:myapp/pages/home_screen/home_contents.dart';
import 'package:myapp/pages/profile_screen/profile_screen.dart';
import 'package:myapp/pages/reels_screen/reels_screen.dart';
import 'package:myapp/pages/search_screen/search_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.userName}) : super(key: key);
  final String userName;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  final List<Widget> screens = [
    const HomeContent(userName: ''),
    const SearchScreen(),
    const AddScreen(),
    const ReelsScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            const Size.fromHeight(65.0), // Set your desired height here

        child: AppBar(
          backgroundColor: const Color.fromARGB(255, 10, 8, 8),
          title: const Text(
            'Instagram',
            style: TextStyle(
              decoration: TextDecoration.none,
              fontFamily: billabong,
              fontSize: 30,
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.add_box_outlined),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.favorite_border_outlined),
              onPressed: () {},
            ),
            IconButton(
              onPressed: () {},
              icon: Image.asset(
                icChat,
                width: 24,
                height: 24,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color.fromARGB(255, 5, 5, 7),
        unselectedItemColor: const Color.fromARGB(255, 81, 81, 83),
        currentIndex: currentIndex,
        onTap: (index) {
          // Handle bottom navigation item tap
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_outlined),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box_outlined),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_library),
            label: 'Reels',
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


        // onTap: (index) {
        //   // Handle bottom navigation item tap
        //   if (index == 4) {
        //     // If Profile item is tapped (index 4), navigate to the ProfileScreen
        //     Navigator.push(
        //       context,
        //       MaterialPageRoute(builder: (context) => const ProfileScreen()),
        //     );
        //   }
        // },