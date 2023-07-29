import 'package:flutter/material.dart';
import 'package:myapp/models/models.dart';
import 'package:myapp/pages/home_screen/details_screen_pageview.dart';
import '../profile_screen/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController _pageController;
  final int _currentpage = 0;

  @override
  void initState() {
    super.initState();
    _pageController =
        PageController(initialPage: _currentpage, viewportFraction: 0.8);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

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
              padding: const EdgeInsets.all(8.0),
              child: ClipOval(
                child: Image.asset(
                  'assets/images/makeup.png',
                  width: 40,
                  height: 40,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(8.0),
            child: const TextField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: 'Search...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
              ),
            ),
          ),
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'New Releases',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 27,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(
                width: 110,
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_horiz_outlined),
              ),
            ],
          ),
          Expanded(
            child: PageView.builder(
              itemCount: dataList.length,
              physics: const ClampingScrollPhysics(),
              controller: _pageController,
              itemBuilder: (context, index) {
                return carouselView(index);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget carouselView(int index) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (context, child) {
        double value = 0.0;
        if (_pageController.position.haveDimensions) {
          value = index.toDouble() - (_pageController.page ?? 0);
          value = (value * 0.038).clamp(-1, 1);
        }
        return Transform.rotate(
          angle: 3.14156 * value,
          child: carouselCard(dataList[index]),
        );
      },
    );
  }

  Widget carouselCard(DataModel data) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Hero(
              tag: data.imageName,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailsScreen(data: data)),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                      image: AssetImage(data.imageName),
                      fit: BoxFit.fill,
                    ),
                    boxShadow: const [
                      BoxShadow(
                        offset: Offset(0, 4),
                        blurRadius: 4,
                        color: Colors.black26,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
