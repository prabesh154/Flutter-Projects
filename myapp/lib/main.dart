import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EMart Nepal'),
        leading: const Icon(Icons.arrow_back),
        actions: [
          const Icon(
            Icons.settings,
          ),
          const SizedBox(width: 20),
          InkWell(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Notifications")),
              );
            },
            child: const Icon(
              Icons.notifications,
              color: Color.fromARGB(255, 240, 240, 241),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Image.asset(
            'assets/images/makeup.png',
            width: 300,
            height: 200,
            fit: BoxFit.fill,
          ),
          const SizedBox(height: 20),
          const Text('Welcome to EMart Nepal'),
          const Text(
            'Makeup Industry in Nepal is changing. Various brands have been eyeing in the Nepalese market.The latest trends have been influenced by from the west and it has continued growing in the rapid scale ',
            style:
                TextStyle(fontSize: 15, color: Color.fromARGB(255, 62, 57, 57)),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Read More'),
          ),
          GestureDetector(
            onTap: () {},
            child: const Card(
              color: Colors.blueAccent,
              elevation: 10,
              shape: BeveledRectangleBorder(),
              child: Text(
                'Add to Cart',
              ),
            ),
          )
        ]),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color.fromARGB(255, 94, 88, 246),
        unselectedItemColor: const Color.fromARGB(255, 137, 170, 243),
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category_outlined),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
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
