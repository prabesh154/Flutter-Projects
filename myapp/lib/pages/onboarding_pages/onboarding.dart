import 'package:flutter/material.dart';
import 'package:myapp/pages/home_screen/home_screen.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  PageController pageController = PageController(initialPage: 0);
  var currentPosition = 0;
  int numPages = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        onPageChanged: (value) {},
        controller: pageController,
        children: [
          Container(
              child: Column(
            children: [
              Image.asset('assets/images/makeup.png'),
              const Text('Demo Title'),
              const Text(
                  'Hello I am this and Welcome to this application.Hope you will enjoy this.')
            ],
          )),
          Container(
              child: Column(
            children: [
              Image.asset('assets/images/makeup.png'),
              const Text('Demo Title Next'),
              const Text(
                  'Hello I am this and Welcome to this application.Hope you will enjoy this.')
            ],
          )),
          Container(
              child: Column(
            children: [
              Image.asset('assets/images/makeup.png'),
              const Text('Demo Title Furthur'),
              const Text(
                  'Hello I am this and Welcome to this application.Hope you will enjoy this.')
            ],
          )),
        ],
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MaterialButton(
            onPressed: () {
              if (currentPosition < numPages - 1) {
                setState(() {
                  currentPosition = numPages - 1;
                });
              }

              pageController.animateToPage(currentPosition,
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeInOut);
            },
            child: Text(currentPosition == numPages - 1 ? '' : 'Skip'),
          ),
          MaterialButton(
            onPressed: () {
              if (currentPosition < numPages - 1) {
                setState(() {
                  currentPosition++;
                });

                pageController.animateToPage(currentPosition,
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeInOut);
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(
                      userName: '',
                    ),
                  ),
                );
              }
            },
            child:
                Text(currentPosition < numPages - 1 ? 'Next' : "Let's Start"),
          ),
        ],
      ),
    );
  }
}
