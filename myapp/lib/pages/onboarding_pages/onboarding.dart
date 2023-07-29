import 'package:flutter/material.dart';
import 'package:myapp/pages/home_screen/components/bottom_nav_widget.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  PageController pageController = PageController(initialPage: 0);
  var currentPosition = 0;
  int numPages = 3;

  void skipFunction(int currentPosition) {
    if (currentPosition < numPages - 1) {
      setState(() {
        currentPosition = numPages - 1;
      });
    }

    pageController.animateToPage(currentPosition,
        duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
  }

  void nextFunction(int currentPosition) {
    if (currentPosition < numPages - 1) {
      setState(() {
        currentPosition++;
      });

      pageController.animateToPage(currentPosition,
          duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const BottomNav(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        onPageChanged: (index) {
          // Update the current position on page change
          setState(() {
            currentPosition = index;
          });
        },
        controller: pageController,
        children: [
          Container(
            child: Column(
              children: [
                Image.asset('assets/images/makeup.png'),
                const Text('Demo Title'),
                const Text(
                  'Hello I am this and Welcome to this application.Hope you will enjoy this.',
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                Image.asset('assets/images/makeup.png'),
                const Text('Demo Title Next'),
                const Text(
                  'Hello I am this and Welcome to this application.Hope you will enjoy this.',
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                Image.asset('assets/images/makeup.png'),
                const Text('Demo Title Furthur'),
                const Text(
                  'Hello I am this and Welcome to this application.Hope you will enjoy this.',
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MaterialButton(
            onPressed: () {
              skipFunction(currentPosition);
            },
            child: Text(currentPosition == numPages - 1 ? '' : 'Skip'),
          ),
          MaterialButton(
            onPressed: () {
              nextFunction(currentPosition);
            },
            child:
                Text(currentPosition < numPages - 1 ? 'Next' : "Let's Start"),
          ),
        ],
      ),
    );
  }
}
