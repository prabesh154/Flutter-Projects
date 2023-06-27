import 'package:flutter/material.dart';
import 'package:quizapp/questions_screen.dart';
import 'start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  var activeScreen = 'start-screen';

  //switchScreen not parenthesis because it will execute. here only provides pointer.
  //@override
  //provided by State Class so override.
  //init state will execute once .
  // void initState() {
  //   activeScreen = StartScreen(switchScreen);

  //   super.initState();
  // }

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'questions-screen') {
      screenWidget = const QuestionsScreen();
    }
    return MaterialApp(
        home: Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          //constructor functions.
          gradient: LinearGradient(
            colors: [Colors.deepPurple, Color.fromRGBO(78, 131, 210, 1)],
            begin: Alignment.topLeft,
            end: Alignment.topRight,
          ),
        ),
        child: screenWidget,
      ),
    ));
  }
}
