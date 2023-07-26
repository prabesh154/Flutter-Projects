import 'package:flutter/material.dart';
import 'package:myapp/pages/shop_screen/shop_screen.dart';
import 'package:myapp/pages/home_screen/home_contents.dart';
import 'package:myapp/pages/profile_screen/profile_screen.dart';
import 'package:myapp/pages/settings_screen/settings_screen.dart';
import 'package:myapp/pages/bookmarks_screen/bookmarks_screen.dart';

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
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        shadowColor: const Color.fromARGB(255, 255, 255, 255),
        leading: const Icon(
          Icons.menu,
          color: Colors.black,
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfileScreen()),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(
                  8.0), // Optional padding for the circular image
              child: ClipOval(
                child: Image.asset(
                  'assets/images/makeup.png',
                  width: 40,
                  height: 40,
                  fit: BoxFit
                      .cover, // You can choose BoxFit.contain if you prefer
                ),
              ),
            ),
          ),
        ],
      ),

      // appBar: PreferredSize(
      //   preferredSize:
      //       const Size.fromHeight(65.0), // Set your desired height here

      //   child: AppBar(
      //     backgroundColor: const Color.fromARGB(255, 10, 8, 8),
      //     title: const Text(
      //       'Instagram',
      //       style: TextStyle(
      //         decoration: TextDecoration.none,
      //         fontFamily: billabong,
      //         fontSize: 30,
      //       ),
      //     ),
      //     actions: [
      //       IconButton(
      //         icon: const Icon(Icons.add_box_outlined),
      //         onPressed: () {},
      //       ),
      //       IconButton(
      //         icon: const Icon(Icons.favorite_border_outlined),
      //         onPressed: () {},
      //       ),
      //       IconButton(
      //         onPressed: () {},
      //         icon: Image.asset(
      //           icChat,
      //           width: 24,
      //           height: 24,
      //           color: Colors.white,
      //         ),
      //       )
      //     ],
      //   ),
      // ),

      body: Column(
        children: [
          Expanded(
            child: screens[currentIndex],
          ),
        ],
      ),
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
